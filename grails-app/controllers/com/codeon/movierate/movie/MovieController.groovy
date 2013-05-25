package com.codeon.movierate.movie

import com.codeon.movierate.group.Moderator
import com.codeon.movierate.group.UserGroup
import com.codeon.movierate.user.User
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class MovieController {
    def gId
    def average
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [movieInstanceList: Movie.list(params), movieInstanceTotal: Movie.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        [movieInstance: new Movie(params)]
    }

    @Secured(['ROLE_ADMIN'])
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

        render(view: "show", model: [movieInstance: movieInstance])
        return
    }

    def showMovieForGroup(Long id) {
        def movieInstance = Movie.get(id)
        if (!movieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'movie.label', default: 'Movie'), id])
            redirect(action: "list")
            return
        }

        def userGroupInstace = UserGroup.get(params.gId)

        def comments = Comment.findAllByMovieAndGroup(movieInstance, userGroupInstace)
        String average = '0'
        BigDecimal total = BigDecimal.ZERO
        BigDecimal i = BigDecimal.ZERO
        def ratings = Score.findAllByMovieAndGroup(movieInstance, userGroupInstace)
        for (rating in ratings) {
            total = total.add(rating.score)
            i = i.add(BigDecimal.ONE)
        }

        if (i.compareTo(BigDecimal.ZERO) > 0) {
            average = total.divide(i).toPlainString()
        }

        def user = springSecurityService.currentUser
        render(view: "show", model: [movieInstance: movieInstance, gId: params.gId, comments: comments, ratings: average, loggedUser: user, canDelete: (user == userGroupInstace.owner || Moderator.findByGroupAndUser(userGroupInstace, user) != null)])
        return
    }

    def find() {
        if (!request.post) {
            return
        }

        // TODO: Por ahora solo permite buscar nombres de pelicula exactos
        def movies = Movie.findAllByTitleIlike("%$params.title%")
        if (!movies || movies.isEmpty()) {
            redirect action: 'list'
//            return [message: 'movies.not.found']
        }

        if (movies.size() > 1) {
            render view: 'list'
        }
        else {
            redirect action: 'show', id: movies[0].id
        }
    }

    @Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        def movieInstance = Movie.get(id)
        if (!movieInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'movie.label', default: 'Movie'), id])
            redirect(action: "list")
            return
        }

        [movieInstance: movieInstance]
    }

    @Secured(['ROLE_ADMIN'])
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

    @Secured(['ROLE_ADMIN'])
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

    def comment() {
        def movieInstance = Movie.get(params.id)
        def userGroup = UserGroup.get(params.gId)
        User user = springSecurityService.currentUser
        String comment = params.comments
        if (comment != null && comment.length() > 0) {
            new Comment(commenter: user, commentText: comment, group: userGroup, movie:  movieInstance, dateCreated: new Date()).save(flush: true)
        }
        redirect(action: "showMovieForGroup", id: params.id, params: [gId: params.gId])
        return
    }

    def rate() {
        def movieInstance = Movie.get(params.id)
        def userGroup = UserGroup.get(params.gId)
        User user = springSecurityService.currentUser
        if (params.rating != null) {
            BigDecimal score = new BigDecimal(params.rating)

            if (score != null && score.compareTo(BigDecimal.ZERO) > 0) {
                Score savedScore = Score.findByMovieAndUser(movieInstance, user)
                if (savedScore != null) {
                    savedScore.score = score
                    savedScore.save(flush: true)
                } else {
                    new Score(user: user, score: score, group: userGroup, movie:  movieInstance).save(flush: true)
                }
            }
        }

        redirect(action: "showMovieForGroup", id: params.id, params: [gId: params.gId])
    }
}
