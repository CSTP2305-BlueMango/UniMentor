//
//  SignupValidation.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-30.
//

import Foundation

func signupValidation(_ email: String, _ password: String, _ confirmPassword: String) throws {
    
    //validate email
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    guard emailPredicate.evaluate(with: email) else {
        throw CustomError.invalidEmail
    }
    
    //validate password
    let passwordPredicate = NSPredicate(format:"SELF MATCHES %@","^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
    guard passwordPredicate.evaluate(with: password) else {
        throw CustomError.invalidPassword
    }
    
    guard password == confirmPassword else {
        throw CustomError.passwordNotMatched
    }
}
