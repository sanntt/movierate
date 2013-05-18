package com.codeon.movierate.main

import com.codeon.movierate.movie.Movie
import com.codeon.movierate.user.User
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

/*@Secured(['ROLE_USER', 'ROLE_ADMIN'])
 */
class IndexController {
    def springSecurityService

    def index(Integer max) {
        def config = SpringSecurityUtils.securityConfig

        params.sort = "created"
        params.order = "desc"
        params.max = Math.min(max ?: 7, 100)

        String view = 'index'
        def movies = Movie.list(params)
        def total = Movie.count()
        if (springSecurityService.isLoggedIn()) {
            render view: view, model: [movies: movies, totalMovies: total]
            return
        }

        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
        render view: view, model: [postUrl: postUrl, rememberMeParameter: config.rememberMe.parameter, movies: movies, totalMovies: total]
    }
}
