//
//  AppViewModel.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-25.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject {
    let auth = Auth.auth()
    
    @Published var loggedIn = false
    
    var isLoggedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email,
                    password: password) {
            [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.loggedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) {
            [weak self] result, error in
            guard result !== nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.loggedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.loggedIn = false
    }
}
