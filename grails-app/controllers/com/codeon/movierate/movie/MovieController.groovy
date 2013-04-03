package com.codeon.movierate.movie

import org.springframework.dao.DataIntegrityViolationException

class MovieController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [movieInstanceList: Movie.list(params), movieInstanceTotal: Movie.count()]
    }

    def create() {
        [movieInstance: new Movie(params)]
    }

    def save() {
        def movieInstance = new Movie(params)
        if (!movieInstance.save(flush: true)) {
            render(view: "create", model: [movieInstance: movieInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'movie.label', default: 'Movie'), movieInstance.id])
        redirect(action: "show", id: movieInstance.id)
    }

    def show(Long id) {
        def movieInstance = Movie.get(id)
        if (!movieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'movie.label', default: 'Movie'), id])
            redirect(action: "list")
            return
        }

        [movieInstance: movieInstance]
    }

    def edit(Long id) {
        def movieInstance = Movie.get(id)
        if (!movieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'movie.label', default: 'Movie'), id])
            redirect(action: "list")
            return
        }

        [movieInstance: movieInstance]
    }

    def update(Long id, Long version) {
        def movieInstance = Movie.get(id)
        if (!movieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'movie.label', default: 'Movie'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (movieInstance.version > version) {
                movieInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'movie.label', default: 'Movie')] as Object[],
                          "Another user has updated this Movie while you were editing")
                render(view: "edit", model: [movieInstance: movieInstance])
                return
            }
        }

        movieInstance.properties = params

        if (!movieInstance.save(flush: true)) {
            render(view: "edit", model: [movieInstance: movieInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'movie.label', default: 'Movie'), movieInstance.id])
        redirect(action: "show", id: movieInstance.id)
    }

    def delete(Long id) {
        def movieInstance = Movie.get(id)
        if (!movieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'movie.label', default: 'Movie'), id])
            redirect(action: "list")
            return
        }

        try {
            movieInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'movie.label', default: 'Movie'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'movie.label', default: 'Movie'), id])
            redirect(action: "show", id: id)
        }
    }
}
