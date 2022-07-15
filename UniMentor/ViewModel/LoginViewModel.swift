//
//  LoginViewModel.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-30.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var emailError: String? = ""
    @Published var passwordError: String? = ""
    @Published var isLoginSuccess: Bool = false
    
    func signIn(completion: @escaping () -> Void) {
        
        //reset error after each submit
        self.resetError()
        
        //do - catch to handle format validation
        do {
            try loginValidation(email, password)
            
            Auth.auth().signIn(withEmail: self.email,
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
                
                guard Auth.auth().currentUser!.isEmailVerified else {
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
