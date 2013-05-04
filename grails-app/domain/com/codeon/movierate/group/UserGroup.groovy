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

    String toString(){
        return name
    }

}
