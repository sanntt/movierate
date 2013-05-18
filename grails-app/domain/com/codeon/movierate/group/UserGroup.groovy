package com.codeon.movierate.group

import com.codeon.movierate.movie.Movie
import com.codeon.movierate.user.User

/**
 * Created with IntelliJ IDEA.
 * User: slanus
 * Date: 27/03/13
 * Time: 21:46
 * To change this template use File | Settings | File Templates.
 */
class UserGroup {
    String name
    User owner

    static hasMany = [
            administrators: Administrator,
            moderators: Moderator,
            users: NormalUser,
            movies: Movie
    ]

    static constraints = {
        name blank: false, unique: true
        owner blank: false
    }

    String toString(){
        return name
    }

    def containsUser(User user) {
        userIsUser(user) || userIsOwner(user) || userIsAdmin(user) || userIsModerator(user)
    }

    def userIsAdmin(User user) {
        Administrator.findByGroupAndUser(this,user) != null
    }

    def userIsOwner(User user) {
        user.equals(this.owner)
    }

    def userIsModerator(User user) {
        Moderator.findByGroupAndUser(this,user) != null
    }

    def userIsUser(User user) {
        NormalUser.findByGroupAndUser(this,user) != null
    }



}
