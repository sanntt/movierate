package com.codeon.movierate.group

import com.codeon.movierate.user.User

/**
 * Created with IntelliJ IDEA.
 * User: slanus
 * Date: 21/04/13
 * Time: 18:13
 * To change this template use File | Settings | File Templates.
 */
class Owner {
    User user
    UserGroup group

    String toString(){
        return user.toString()
    }
}
