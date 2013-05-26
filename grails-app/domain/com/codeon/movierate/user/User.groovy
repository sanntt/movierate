package com.codeon.movierate.user

import org.apache.commons.lang.builder.HashCodeBuilder

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
        if ((lastName && !lastName.isEmpty()) || (name && !name.isEmpty())) {
            result += " ("
            if (name && !name.isEmpty()) {
                result += name
            }
            if (lastName && !lastName.isEmpty() && name && !name.isEmpty()) {
                result += " "
            }
            if (lastName && !lastName.isEmpty()) {
                result += lastName
            }
            if ((lastName && !lastName.isEmpty()) || (name && !name.isEmpty())) {
                result += ")"
            }
        }

        return result
    }

    boolean equals(other) {
        if (!(other instanceof User)) {
            return false
        }

        other.id == this.id
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        if (this) builder.append(this.id)
        builder.toHashCode()
    }
}
