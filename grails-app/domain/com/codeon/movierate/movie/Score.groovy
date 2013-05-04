package com.codeon.movierate.movie

import com.codeon.movierate.group.UserGroup
import com.codeon.movierate.user.User

/**
 * Created with IntelliJ IDEA.
 * User: slanus
 * Date: 01/05/13
 * Time: 17:23
 * To change this template use File | Settings | File Templates.
 */
class Score {
    User user
    Movie movie
    UserGroup group
    BigDecimal score
}
