package com.codeon.movierate.group

import com.codeon.movierate.user.User

/**
 * Created with IntelliJ IDEA.
 * User: slanus
 * Date: 21/04/13
 * Time: 18:12
 * To change this template use File | Settings | File Templates.
 */
class NormalUser {
    User user
    UserGroup group

    String toString(){
        return user.toString()
    }
}
