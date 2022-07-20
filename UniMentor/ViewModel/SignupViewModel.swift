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
    /// sign up state
    @Published var signUpFinished = false

    /// sign up user
    func signUp() {
        // reset error after each submit
        self.resetError()
        
        do {
            try signupValidation(self.email, self.password, self.confirmPassword)
            FirebaseManager.shared.auth.createUser(withEmail: self.email, password: self.password) {
                result, error in
                guard result !== nil, error == nil else {
                    print(error?.localizedDescription ?? "")
                    return
                }
                self.sendEmailVerification()
            }
            
        } catch CustomError.invalidEmail {
            emailError = "invalid email"
        } catch CustomError.invalidPassword {
            passwordError = "password need 8 characters,1 number,1 uppercase"
        } catch CustomError.passwordNotMatched {
            confirmError = "password not matched"
        } catch{}
    }
    
    func resetError() {
        self.emailError = ""
        self.passwordError = ""
        self.confirmError = ""
    }
    
    func sendEmailVerification() {
        FirebaseManager.shared.auth.currentUser?.sendEmailVerification { error in
            print(error?.localizedDescription ?? "")
        }
    }
}
