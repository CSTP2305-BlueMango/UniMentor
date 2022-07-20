//
//  LoginViewModel.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-30.
//

import Foundation
import FirebaseAuth

/// handle loggin in user
class LoginViewModel: ObservableObject {
    /// user email
    @Published var email: String = ""
    /// user password
    @Published var password: String = ""
    /// email error message
    @Published var emailError: String? = ""
    /// password error message
    @Published var passwordError: String? = ""
    /// login success state
    @Published var isLoginSuccess: Bool = false
    
    /// login user
    func signIn(completion: @escaping () -> Void) {
        
        // reset error after each submit
        self.resetError()
        
        //do - catch to handle format validation
        do {
            // validate email & password
            try loginValidation(email, password)
            
            FirebaseManager.shared.auth.signIn(withEmail: self.email,
                               password: self.password) {
                [weak self] result, error in
                guard result != nil, error == nil else {
                    
                        //login failed error
                        if error?.localizedDescription == "The password is invalid or the user does not have a password." {
                            self?.passwordError = "wrong password"
                        } else if error?.localizedDescription == "There is no user record corresponding to this identifier. The user may have been deleted." {
                            self?.emailError = "email not exist"
                        } else {
                            print(error!.localizedDescription)
                        }
                    return
                }
                
                guard FirebaseManager.shared.auth.currentUser!.isEmailVerified else {
                    self?.emailError = "email is not verify"
                    return
                }
                
                print("Succressfully logged in as user: \(result?.user.uid ?? "")")
                
                DispatchQueue.main.async {
                    self?.isLoginSuccess = true
                    completion()
                }
            }
            
        } catch CustomError.invalidEmail {
            emailError = "invalid email"
        } catch CustomError.invalidPassword {
            passwordError = "invalid password"
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func resetError() {
        self.emailError = ""
        self.passwordError = ""
    }
}
