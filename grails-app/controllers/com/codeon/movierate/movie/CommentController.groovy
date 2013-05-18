package com.codeon.movierate.movie

import com.codeon.movierate.group.Moderator
import com.codeon.movierate.group.UserGroup
import org.springframework.dao.DataIntegrityViolationException

class CommentController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [commentInstanceList: Comment.list(params), commentInstanceTotal: Comment.count()]
    }

    def create() {
        [commentInstance: new Comment(params)]
    }

    def save() {
        def commentInstance = new Comment(params)
        if (!commentInstance.save(flush: true)) {
            render(view: "create", model: [commentInstance: commentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'comment.label', default: 'Comment'), commentInstance.id])
        redirect(action: "show", id: commentInstance.id)
    }

    def show(Long id) {
        def commentInstance = Comment.get(id)
        if (!commentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), id])
            redirect(action: "list")
            return
        }

        [commentInstance: commentInstance]
    }

    def edit(Long id) {
        def commentInstance = Comment.get(id)
        if (!commentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), id])
            redirect(action: "list")
            return
        }

        [commentInstance: commentInstance]
    }

    def update(Long id, Long version) {
        def commentInstance = Comment.get(id)
        if (!commentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (commentInstance.version > version) {
                commentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'comment.label', default: 'Comment')] as Object[],
                        "Another user has updated this Comment while you were editing")
                render(view: "edit", model: [commentInstance: commentInstance])
                return
            }
        }

        commentInstance.properties = params

        if (!commentInstance.save(flush: true)) {
            render(view: "edit", model: [commentInstance: commentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'comment.label', default: 'Comment'), commentInstance.id])
        redirect(action: "show", id: commentInstance.id)
    }

    def delete(Long id) {
        def commentInstance = Comment.get(id)
        def user = springSecurityService.currentUser
        def group = UserGroup.get(params.gId)
        if (!commentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), id])
            redirect(controller: "movie", action: "showMovieForGroup", id: params.mId, params: [gId: params.gId])

//            redirect(action: "list")
            return
        }

        // Is owner or mod -> can delete comments
        if (user == group.owner || Moderator.findByGroupAndUser(group, user) != null) {
            try {
                commentInstance.delete(flush: true)
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'comment.label', default: 'Comment'), id])

            }
            catch (DataIntegrityViolationException e) {
                flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'comment.label', default: 'Comment'), id])
                redirect(action: "show", id: id)
                return
            }
        }
        redirect(controller: "movie", action: "showMovieForGroup", id: params.mId, params: [gId: params.gId])
        return
    }
}
