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
    User owner
    List<Administrator> administrator
    List<Moderator> moderators
    List<User> users
    List<Movie> movies


}
