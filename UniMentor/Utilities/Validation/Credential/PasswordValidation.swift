//
//  PasswordValidation.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-07-21.
//

import Foundation

/// password validation
/// parameter: string of password
func validatePassword(password: String) throws -> Void {
    
    // check if password is not empty
    guard !password.isEmpty else {
        throw CustomError.form(field: "password", message: "invalid email")
    }
    
    // check if password is no longer than 8
    guard password.count >= 8 else {
        throw CustomError.form(field: "password", message: "longer than 8")
    }
    
    // reference: https://stackoverflow.com/questions/29535792/check-if-a-string-contains-at-least-a-uppercase-letter-a-digit-or-a-special-ch
    // check if password has at least one uppercase letter
    let oneUppercase = NSPredicate(format:"SELF MATCHES %@", ".*[A-Z]+.*")
    
    guard oneUppercase.evaluate(with: password) else {
        throw CustomError.form(field: "password", message: "at least one uppercase")
    }
    
    // check if password has at least one lowercase letter
    let oneLowercase = NSPredicate(format:"SELF MATCHES %@", ".*[a-z]+.*")
    
    guard oneLowercase.evaluate(with: password) else {
        throw CustomError.form(field: "password", message: "at least one lowercase")
    }
    
    // check if password has at least one digit
    let oneDigit = NSPredicate(format:"SELF MATCHES %@", ".*[0-9]+.*")
    
    guard oneDigit.evaluate(with: password) else {
        throw CustomError.form(field: "password", message: "at least one digit")
    }
    
    // check if password has at least one specialcase
    let oneSpecialChar = NSPredicate(format:"SELF MATCHES %@", ".*[!@#$&*]+.*")
    guard oneSpecialChar.evaluate(with: password) else {
        throw CustomError.form(field: "password", message: "at least one special charactor")
    }
}
