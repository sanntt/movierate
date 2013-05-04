package com.codeon.movierate.group

import com.codeon.movierate.user.User
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class UserGroupController {
    def springSecurityService

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
        def model = [userGroupInstanceList: asOwner, userGroupInstanceTotal: asOwner.size(), userGroupAdmined: asAdmin, userGroupModed: asMod, userGroupAsUser: asUser]
        render(view: "list", model: model)
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
        def canEdit = NormalUser.findAllByGroupAndUser(userGroupInstance, user).isEmpty()
        def canDelete = (user == userGroupInstance.owner)

        [userGroupInstance: userGroupInstance, canDelete: canDelete, canEdit: canEdit]
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

        userGroupInstance.administrators = params.administratorUsers.collect {
            User admin = User.get(it)
            new Administrator(user: admin, group: userGroupInstance)
        }

        userGroupInstance.moderators = params.moderatorUsers.collect {
            User mod = User.get(it)
            new Moderator(user: mod, group: userGroupInstance)
        }

        userGroupInstance.users = params.normalUsers.collect {
            User normalUser = User.get(it)
            new NormalUser(user: normalUser, group: userGroupInstance)
        }

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
            userGroupInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userGroup.label', default: 'UserGroup'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userGroup.label', default: 'UserGroup'), id])
            redirect(action: "show", id: id)
        }
    }
}
