package com.codeon.movierate.movie

/**
 * Created with IntelliJ IDEA.
 * User: slanus
 * Date: 28/03/13
 * Time: 19:52
 * To change this template use File | Settings | File Templates.
 */
class Genre {
    String name

    static hasMany = [movies: Movie]

    static mapping = {
        movies joinTable: [name: "mm_genres_movies", key: 'mm_genre_id']
    }

    String toString() {
        name
    }
}
