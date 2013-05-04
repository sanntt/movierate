package com.codeon.movierate.user

class User {

	transient springSecurityService

	String username
	String password
    String email
    String name
    String lastName
    Date birthDate
    char gender
    boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		password blank: false
        email blank: false
        name nullable: true
        lastName nullable: true
        birthDate nullable: true
	}

	static mapping = {
        lastName column: '`lastname`'
        birthDate column: '`birthdate`'
    }

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

    String toString(){
        def result = username
        if (!lastName.isEmpty() || !name.isEmpty()) {
            result += " ("
        }
        if (!name.isEmpty()) {
            result += name
        }
        if (!lastName.isEmpty() && !name.isEmpty()) {
            result += " "
        }
        if (!lastName.isEmpty()) {
            result += lastName
        }
        if (!lastName.isEmpty() || !name.isEmpty()) {
            result += ")"
        }
        return result
    }
}
