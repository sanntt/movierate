package com.codeon.movierate.main

import com.codeon.movierate.movie.Movie
import com.codeon.movierate.user.User
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER', 'ROLE_ADMIN'])
class IndexController {
    def springSecurityService

    def index() {
        if (!springSecurityService.isLoggedIn())
            return;

        User user = springSecurityService.currentUser
        [movies: Movie.list(max: 12)]
    }
}
