import com.codeon.movierate.group.Administrator
import com.codeon.movierate.group.Moderator
import com.codeon.movierate.group.NormalUser
import com.codeon.movierate.group.Owner
import com.codeon.movierate.group.UserGroup
import com.codeon.movierate.movie.Actor
import com.codeon.movierate.movie.Director
import com.codeon.movierate.movie.Genre
import com.codeon.movierate.movie.Movie
import com.codeon.movierate.user.Role
import com.codeon.movierate.user.User
import com.codeon.movierate.user.UserRole

class BootStrap {

    def init = { servletContext ->

        def adminRole = new Role(
                authority: 'ROLE_ADMIN'
        ).save(flush: true, failOnError: true)
        def userRole = new Role(
                authority: 'ROLE_USER'
        ).save(flush: true, failOnError: true)

        def user = new User(username: 'sann', password: 'qwe123', email: 'santiagolanus@gmail.com', gender: 'M', name: 'Santiago', lastName: 'Perez', enabled: true).save(failOnError: true)
        UserRole.create(user, adminRole)

        def john = new User(username: 'john', password: 'qwe123', email: 'john@gmail.com', gender: 'M', name: 'John', lastName: 'Perez', enabled: true).save(failOnError: true)
        UserRole.create(john, userRole)

        def mike = new User(username: 'mike', password: 'qwe123', email: 'mike@gmail.com', gender: 'M', name: 'Mike', lastName: 'Perez', enabled: true).save(failOnError: true)
        UserRole.create(mike, userRole)

        def sally = new User(username: 'sally', password: 'qwe123', email: 'sally@gmail.com', gender: 'M', name: 'Sally', lastName: 'Perez', enabled: true).save(failOnError: true)
        UserRole.create(sally, userRole)

        def tom = new User(username: 'tom', password: 'qwe123', email: 'tom@gmail.com', gender: 'M', name: 'Tom', lastName: 'Perez', enabled: true).save(failOnError: true)
        UserRole.create(tom, adminRole)

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

        UserGroup group1 = new UserGroup(name: 'Familia', owner: user).save(failOnError: true)
        //Owner owner = new Owner(user: user, group: group1).save(failOnError: true, flush: true)
        Administrator admin1 = new Administrator(user: tom, group: group1).save(failOnError: true, flush: true)
        Moderator mod1 = new Moderator(user: sally, group: group1).save(failOnError: true, flush: true)
        NormalUser u1 = new NormalUser(user: mike, group: group1).save(failOnError: true, flush: true)
        group1.addToMovies(batman)
                .addToMovies(batmanThree)
                .addToAdministrators(admin1)
                .addToModerators(mod1)
                .addToUsers(u1)
                .save(failOnError: true, flush: true)


        UserGroup group2 = new UserGroup(name: 'Amigos', owner: tom).save(failOnError: true)
        //Owner owner2 = new Owner(user: tom, group: group2).save(failOnError: true, flush: true)
        Moderator mod2 = new Moderator(user: user, group: group2).save(failOnError: true, flush: true)
        NormalUser u2 = new NormalUser(user: john, group: group2).save(failOnError: true, flush: true)
        NormalUser u3 = new NormalUser(user: sally, group: group2).save(failOnError: true, flush: true)
        group2.addToMovies(batman)
                .addToModerators(mod2)
                .addToUsers(u2)
                .addToUsers(u3)
                .save(failOnError: true, flush: true)

    }
    def destroy = {
    }
}
