//
//  SignupViewModel.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-30.
//

import Foundation
//import FirebaseAuth

class SignupViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var name: String = ""
    @Published var emailError: String? = ""
    @Published var passwordError: String? = ""
    @Published var confirmError: String? = ""

    func signUp() {
        
        self.resetError()
        self.storeUserInfo()
        
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
    
    //STILL NEED TO STORE IMAGE
    //for storing information into Firestore database
    func storeUserInfo() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            return }

        //create the dictionary, this is what will be stored in the database
        let userInfo = [FirebaseConstants.uid: uid, FirebaseConstants.email: self.email, FirebaseConstants.name: self.name, FirebaseConstants.password: self.password]

        //this makes the collection of users into the firestore database
        FirebaseManager.shared.firestore.collection("signUpUsers")
            .document(uid).setData(userInfo) { error in
                if let error = error {
                    print(error)
                    //self.loginStatusMessage = "\(err)"
                    return
                }
            }
        }
}
