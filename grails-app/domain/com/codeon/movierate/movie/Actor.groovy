package com.codeon.movierate.movie

/**
 * Created with IntelliJ IDEA.
 * User: slanus
 * Date: 28/03/13
 * Time: 19:51
 * To change this template use File | Settings | File Templates.
 */
class Actor extends Person {

//    static hasMany = [movies: Movie]

    static mapping = {
        lastName column: '`lastname`'
//        movies joinTable: [name: "mm_actors_movies", key: 'mm_actor_id']
    }

    String toString() {
        return name + " " + lastName
    }
}
