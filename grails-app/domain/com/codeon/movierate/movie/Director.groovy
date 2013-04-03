package com.codeon.movierate.movie

/**
 * Created with IntelliJ IDEA.
 * User: slanus
 * Date: 28/03/13
 * Time: 19:52
 * To change this template use File | Settings | File Templates.
 */
class Director extends Person {

    static hasMany = [movies: Movie]

    static mapping = {
        movies joinTable: [name: "mm_directors_movies", key: 'mm_director_id']
        lastName column: '`lastname`'
    }

    String toString() {
        return name + " " + lastName
    }
}
