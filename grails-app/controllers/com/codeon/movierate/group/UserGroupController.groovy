package com.codeon.movierate.group

import com.codeon.movierate.movie.Comment
import com.codeon.movierate.movie.Score
import com.codeon.movierate.user.User
import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class UserGroupController {
    def springSecurityService
    def userGroupService
    def util

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userGroupInstanceList: UserGroup.list(params), userGroupInstanceTotal: UserGroup.count()]
    }

    def listMyGroups() {
        User user = springSecurityService.currentUser
        def asOwner = UserGroup.findAllByOwner(user)
        def asAdmin = Administrator.findAllByUser(user).group
        def asMod = Moderator.findAllByUser(user).group
        def asUser = NormalUser.findAllByUser(user).group
        def model = [userGroupOwner: asOwner, userGroupAdmined: asAdmin, userGroupModed: asMod, userGroupAsUser: asUser]
        render(view: "page_grails", model: model)
        return
    }

    def create() {
        User user = springSecurityService.currentUser
        def userGroup = new UserGroup(params)
        userGroup.owner = user
        [userGroupInstance: userGroup]
    }

    def save() {
        User user = springSecurityService.currentUser
        def userGroupInstance = new UserGroup(params)
        userGroupInstance.owner = user

        userGroupInstance.users = params.normalUsers.collect {
            User normalUser = User.get(it)
            new NormalUser(user: normalUser, group: userGroupInstance)
        }

        if (!userGroupInstance.save(flush: true)) {
            render(view: "create", model: [userGroupInstance: userGroupInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'userGroup.label', default: 'UserGroup'), userGroupInstance.id])
        redirect(action: "show", id: userGroupInstance.id)
    }

    def show(Long id) {
        def userGroupInstance = UserGroup.get(id)
        if (!userGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userGroup.label', default: 'UserGroup'), id])
            redirect(action: "list")
            return
        }

        User user = springSecurityService.currentUser
        if (userGroupInstance.containsUser(user)) {
            def isOwner = userGroupInstance.userIsOwner(user)
            def canEdit =  isOwner || userGroupInstance.userIsAdmin(user) || userGroupInstance.userIsModerator(user)
            def canDelete = userGroupInstance.userIsOwner(user)

            def users = []
            if (isOwner) {
                // We use this in case owner wants to abandon group
                users = Administrator.findAllByGroup(userGroupInstance)*.user +
                        Moderator.findAllByGroup(userGroupInstance)*.user +
                        NormalUser.findAllByGroup(userGroupInstance)*.user
            }

            render(view: "showGroup", model: [userGroupInstance: userGroupInstance, canDelete: canDelete, canEdit: canEdit, users: users])
            return
        }
        redirect(action: "list")
        return
    }

    def edit(Long id) {
        def userGroupInstance = UserGroup.get(id)
        if (!userGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userGroup.label', default: 'UserGroup'), id])
            redirect(action: "list")
            return
        }

        [userGroupInstance: userGroupInstance]
    }

    def update(Long id, Long version) {
        def userGroupInstance = UserGroup.get(id)
        if (!userGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userGroup.label', default: 'UserGroup'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userGroupInstance.version > version) {
                userGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'userGroup.label', default: 'UserGroup')] as Object[],
                          "Another user has updated this UserGroup while you were editing")
                render(view: "edit", model: [userGroupInstance: userGroupInstance])
                return
            }
        }

        userGroupInstance.properties = params
        /*User admin = User.get(it)
       if (!admin in params.admins.user) {
           new Administrator(user: admin, group: userGroupInstance)
       } */

        /** GUARDA DOS VECES EL MISMO ADMINISTRADOR
         * if (params.administratorUsers != null) {
            def oldAdministratorsUsers = Administrator.findAllByGroup(userGroupInstance)*.user
            def newAdministrators = params.administratorUsers.findAll{String newAdminUserId -> !oldAdministratorsUsers*.id.contains(newAdminUserId)}
            userGroupInstance.administrators = newAdministrators.collect {
                def user = User.get(it)
                new Administrator(user: user, group: userGroupInstance)
            }
        } */

        Administrator.findAllByGroup(userGroupInstance)*.delete()
        if (params.administratorUsers != null) {
            userGroupInstance.administrators = params.administratorUsers.collect {
                def user = User.get(it)
                new Administrator(user: user, group: userGroupInstance)
            }
        }

        Moderator.findAllByGroup(userGroupInstance)*.delete()
        if (params.moderatorUsers != null) {
            userGroupInstance.moderators = params.moderatorUsers.collect {
                def user = User.get(it)
                new Moderator(user: user, group: userGroupInstance)
            }
        }

        NormalUser.findAllByGroup(userGroupInstance)*.delete()
        if (params.normalUsers != null) {
            userGroupInstance.users = params.normalUsers.collect {
                def user = User.get(it)
                new NormalUser(user: user, group: userGroupInstance)
            }
        }

        /*userGroupInstance.moderators = params.moderatorUsers.collect {
            User mod = User.get(it)
            new Moderator(user: mod, group: userGroupInstance)
        }

        userGroupInstance.users = params.normalUsers.collect {
            User normalUser = User.get(it)
            new NormalUser(user: normalUser, group: userGroupInstance)
        } */

        if (!userGroupInstance.save(flush: true)) {
            render(view: "edit", model: [userGroupInstance: userGroupInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userGroup.label', default: 'UserGroup'), userGroupInstance.id])
        redirect(action: "show", id: userGroupInstance.id)
    }

    def delete(Long id) {
        if (!UserGroup.get(id).owner == springSecurityService.currentUser)
            return

        def userGroupInstance = UserGroup.get(id)
        if (!userGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userGroup.label', default: 'UserGroup'), id])
            redirect(action: "list")
            return
        }

        try {
            Comment.deleteAll(Comment.findAllByGroup(userGroupInstance))
            Score.deleteAll(Score.findAllByGroup(userGroupInstance))
            Administrator.deleteAll(Administrator.findAllByGroup(userGroupInstance))
            Moderator.deleteAll(Moderator.findAllByGroup(userGroupInstance))
            NormalUser.deleteAll(NormalUser.findAllByGroup(userGroupInstance))
            //Owner.deleteAll(Owner.findAllByGroup(userGroupInstance))
            userGroupInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userGroup.label', default: 'UserGroup'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userGroup.label', default: 'UserGroup'), id])
            redirect(action: "show", id: id)
        }
    }

    def abandon(Long id, String newOwner) {
        def userGroupInstance = UserGroup.get(id)
        if (!userGroupInstance) {
           flash.message = message(code: 'default.not.found.message', args: [message(code: 'userGroup.label', default: 'UserGroup'), id])
           redirect(action: "list")
           return
        }

        def user = springSecurityService.currentUser
        if (newOwner != null) {
            user = User.get(newOwner)
        }
        if (userGroupInstance.userIsOwner(user)) {
            if (params.new_owner != null && params.new_owner != '0') {
                def new_owner = User.get(params.new_owner)
                abandon(id, params.new_owner)
                userGroupInstance.owner = new_owner
            } else {
                delete(id)
                return
            }
        }
        if (userGroupInstance.userIsAdmin(user)) {
            Administrator.findByGroupAndUser(userGroupInstance, user).delete()
        }
        if (userGroupInstance.userIsModerator(user)) {
            Moderator.findByGroupAndUser(userGroupInstance, user).delete()
        }
        if (userGroupInstance.userIsUser(user)) {
            NormalUser.findByGroupAndUser(userGroupInstance, user).delete()
        }
        if (newOwner == null) {
            redirect(action: "listMyGroups")
            return
        }
    }


}
