package com.codeon.movierate.movie

import com.codeon.movierate.group.UserGroup
import com.codeon.movierate.user.User

/**
 * Created with IntelliJ IDEA.
 * User: slanus
 * Date: 27/03/13
 * Time: 21:52
 * To change this template use File | Settings | File Templates.
 */
class Comment {
    String commentText
    Date dateCreated
    User commenter
    UserGroup group
    Movie movie

    static mapping = {
        commentText column: '`commenttext`'
        dateCreated column: '`datecreated`'
    }

    String toString(){
        return commenter.toString() + ": " + commentText + " - (" + dateCreated + ")"
    }
}
