package com.codeon.movierate.register

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class RegisterController extends grails.plugins.springsecurity.ui.RegisterController {

    @Override
    static boolean checkPasswordRegex(String password, command) {
        def conf = SpringSecurityUtils.securityConfig

        String passValidationRegex = conf.ui.password.validationRegex ?:
            '^.*(?=.*\\d?)(?=.*[a-zA-Z])(?=.*[!@#$%^&]?).*$'

        password && password.matches(passValidationRegex)
    }
}
