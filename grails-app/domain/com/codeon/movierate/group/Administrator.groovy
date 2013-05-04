package com.codeon.movierate.group

import com.codeon.movierate.user.User

/**
 * Created with IntelliJ IDEA.
 * User: slanus
 * Date: 28/03/13
 * Time: 11:19
 * To change this template use File | Settings | File Templates.
 */
class Administrator {
    User user
    UserGroup group

    String toString(){
        return user.toString()
    }
}
