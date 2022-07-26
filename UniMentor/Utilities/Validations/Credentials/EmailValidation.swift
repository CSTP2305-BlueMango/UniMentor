//
//  EmailValidation.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-07-21.
//

import Foundation

/// Function that validates and sends a verification email to users email address to confirm email

func validateEmail(email: String) throws {
    //validate email
    //email regex ref: https://www.hackingwithswift.com/forums/swiftui/what-is-a-good-practice-to-handle-textfield-validations/5868
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}");
    guard emailPredicate.evaluate(with: email) else {
        throw CustomError.form(field: "email", message: "invalid email");
    }
}

