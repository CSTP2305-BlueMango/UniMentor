//
//  SignupViewModel.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-30.
//

import Foundation
import FirebaseAuth

/// handle sign up user
class SignupViewModel: ObservableObject {
    
    /// user email
    @Published var email: String = ""
    
    /// user password
    @Published var password: String = ""
    
    /// confirm password
    @Published var confirmPassword: String = ""
    
    /// user name
    @Published var name: String = ""
    
    /// email error message
    @Published var emailError: String? = ""
    
    /// password error message
    @Published var passwordError: String? = ""
    
    /// comfirm password error message
    @Published var confirmError: String? = ""
    
    ///name error message
    @Published var nameError: String? = ""
    
    /// sign up state
    @Published var signUpFinished = false

    /// sign up user
    func signUp(onSuccess: @escaping ()-> Void) {
        do {
            self.resetError()
            try validateSignupCredential(self.name, self.email, self.password, self.confirmPassword)
            FirebaseManager.shared.auth.createUser(withEmail: self.email, password: self.password) {
                result, error in
                guard result !== nil, error == nil else {
                    if error?.localizedDescription == "The email address is already in use by another account." {
                        self.emailError = "email already exist"
                    } else {
                        print(error!.localizedDescription)
                    }
                    return;
                }
                self.sendEmailVerification()
                onSuccess()
            }
            
        } catch CustomError.form(let field, let message) {
            switch field {
            case "name":
                nameError = message;
            case "email":
                emailError = message;
            case "password":
                passwordError = message;
            case "confirm password":
                confirmError = message;
            default:
                return;
            }
            
        } catch {
            print(error.localizedDescription);
        }
    }
    
    func resetError() {
        self.nameError = "";
        self.emailError = "";
        self.passwordError = "";
        self.confirmError = "";
    }
    
    func sendEmailVerification() {
        FirebaseManager.shared.auth.currentUser?.sendEmailVerification { error in
            print(error?.localizedDescription ?? "")
        }
    }
}
