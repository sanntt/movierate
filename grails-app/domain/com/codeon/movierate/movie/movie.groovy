package com.codeon.movierate.movie

/**
 * Created with IntelliJ IDEA.
 * User: slanus
 * Date: 27/03/13
 * Time: 21:51
 * To change this template use File | Settings | File Templates.
 */
class Movie {
    String title
    int year
    String plot
    String poster

    // static belongsTo = [Actor, Genre, Director]

    static hasMany = [
            actors: Actor,
            genres: Genre,
            directors: Director
    ]

    static constraints = {
        title blank: false
        actors nullable: true
        genres nullable: true
        directors nullable: true
    }

    static mapping = {
//        genres joinTable: [name: "mm_genres_movies", key: 'mm_movie_id']
//        actors joinTable: [name: "mm_actors_movies", key: 'mm_movie_id']
//        directors joinTable: [name: "mm_directors_movies", key: 'mm_movie_id']
    }
}
