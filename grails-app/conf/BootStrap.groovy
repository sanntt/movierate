import com.codeon.movierate.user.Role
import com.codeon.movierate.user.User
import com.codeon.movierate.user.UserRole

class BootStrap {

    def init = { servletContext ->
        def user = new User(username: 'sann', password: 'qwe123', enabled: true).save()
        def role = new Role(authority: 'ADMIN').save()
        UserRole.create(user, role)
    }
    def destroy = {
    }
}
