//
//  LoginValidation.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-30.
//

import Foundation

func loginValidation(_ email: String, _ password: String) throws {
    
    //validate email
    //email regex ref: https://www.hackingwithswift.com/forums/swiftui/what-is-a-good-practice-to-handle-textfield-validations/5868
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    guard emailPredicate.evaluate(with: email) else {
        throw CustomError.invalidEmail
    }
    
    //validate password
    //password regex ref: https://medium.com/swlh/password-validation-in-swift-5-3de161569910va
    let passwordPredicate = NSPredicate(format:"SELF MATCHES %@","^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
    guard passwordPredicate.evaluate(with: password) else {
        throw CustomError.invalidPassword
    }
}
