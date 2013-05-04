package com.codeon.movierate.movie

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class DirectorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [directorInstanceList: Director.list(params), directorInstanceTotal: Director.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        [directorInstance: new Director(params)]
    }

    @Secured(['ROLE_ADMIN'])
    def save() {
        def directorInstance = new Director(params)
        if (!directorInstance.save(flush: true)) {
            render(view: "create", model: [directorInstance: directorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'director.label', default: 'Director'), directorInstance.id])
        redirect(action: "show", id: directorInstance.id)
    }

    def show(Long id) {
        def directorInstance = Director.get(id)
        if (!directorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'director.label', default: 'Director'), id])
            redirect(action: "list")
            return
        }

        [directorInstance: directorInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        def directorInstance = Director.get(id)
        if (!directorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'director.label', default: 'Director'), id])
            redirect(action: "list")
            return
        }

        [directorInstance: directorInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def update(Long id, Long version) {
        def directorInstance = Director.get(id)
        if (!directorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'director.label', default: 'Director'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (directorInstance.version > version) {
                directorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'director.label', default: 'Director')] as Object[],
                        "Another user has updated this Director while you were editing")
                render(view: "edit", model: [directorInstance: directorInstance])
                return
            }
        }

        directorInstance.properties = params

        if (!directorInstance.save(flush: true)) {
            render(view: "edit", model: [directorInstance: directorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'director.label', default: 'Director'), directorInstance.id])
        redirect(action: "show", id: directorInstance.id)
    }

    @Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def directorInstance = Director.get(id)
        if (!directorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'director.label', default: 'Director'), id])
            redirect(action: "list")
            return
        }

        try {
            directorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'director.label', default: 'Director'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'director.label', default: 'Director'), id])
            redirect(action: "show", id: id)
        }
    }
}
