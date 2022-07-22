//
//  SignupValidation.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-30.
//

import Foundation

func validateSignupCredential(_ name: String, _ email: String, _ password: String, _ confirmPassword: String) throws {
    
    //validate email and password
    do {
        try validateEmail(email: email);
        try validatePassword(password: password);
            
        //validate name
        guard !name.isEmpty else {
            throw CustomError.form(field: "name", message: "name is required")
        }
    
        //validate confirm password
        guard password == confirmPassword else {
            throw CustomError.form(field: "confirm password", message: "password does not match");
        }
        
    } catch CustomError.form(let field, let message) {
        throw CustomError.form(field: field, message: message);
    } catch {
        print(error.localizedDescription);
    }
}

