//
//  LoginValidation.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-30.
//

import Foundation

func validateLoginCredential(_ email: String, _ password: String) throws {
    
    /// validate email and password
    do {
        try validateEmail(email: email);
        try validatePassword(password: password);
    } catch CustomError.form(let field, let message) {
        throw CustomError.form(field: field, message: message);
    } catch {
        print(error.localizedDescription);
    }
    
}
