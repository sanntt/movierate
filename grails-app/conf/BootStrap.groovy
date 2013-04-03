import com.codeon.movierate.movie.Actor
import com.codeon.movierate.movie.Director
import com.codeon.movierate.movie.Genre
import com.codeon.movierate.movie.Movie
import com.codeon.movierate.user.Role
import com.codeon.movierate.user.User
import com.codeon.movierate.user.UserRole

class BootStrap {

    def init = { servletContext ->
        def user = new User(username: 'sann', password: 'qwe123', email: 'santiagolanus@gmail.com', gender: 'M', name: 'Santiago', lastName: 'Perez', enabled: true).save(failOnError: true)
        def role = new Role(authority: 'ADMIN').save(failOnError: true)
        UserRole.create(user, role)

        Actor bale = new Actor(name: 'Christian', lastName: 'Bale').save(failOnError: true, flush: true)
        Actor caine = new Actor(name: 'Michael', lastName: 'Cane').save(failOnError: true, flush: true)
        Actor freeman = new Actor(name: 'Morgan', lastName: 'Freeman').save(failOnError: true, flush: true)
        Actor oldman = new Actor(name: 'Gary', lastName: 'Oldman').save(failOnError: true, flush: true)

        Director nolan = new Director(name: 'Christopher', lastName: 'Nolan').save(failOnError: true, flush: true)

        Genre action = new Genre(name: 'Action').save(failOnError: true, flush: true)
        Genre adventure = new Genre(name: 'Adventure').save(failOnError: true, flush: true)
        Genre crime = new Genre(name: 'Crime').save(failOnError: true, flush: true)

        def batman = new Movie(title: 'Batman begins', year: 2005, plot: "Bruce Waine creates Batman", poster: 'http://1.bp.blogspot.com/-Vy4oDVFQReU/UA-A2tS9UqI/AAAAAAAAA7A/J_fKS_Ko3Qw/s1600/b1+-+2.jpg')
                .addToActors(bale)
                .addToActors(caine)
                .addToActors(freeman)
                .addToDirectors(nolan)
                .addToGenres(crime)
                .addToGenres(adventure)
                .save(failOnError: true, flush: true)
        def batmanThree = new Movie(title: 'Batman rises', year: 2013, plot: 'Batman Ends', poster: 'http://ia.media-imdb.com/images/M/MV5BMTk4ODQzNDY3Ml5BMl5BanBnXkFtZTcwODA0NTM4Nw@@._V1_SX214_.jpg')
                .addToGenres(crime)
                .addToGenres(action)
                .addToActors(bale)
                .addToActors(oldman)
                .addToActors(freeman)
                .addToDirectors(nolan)
                .save(failOnError: true, flush: true)
    }
    def destroy = {
    }
}
