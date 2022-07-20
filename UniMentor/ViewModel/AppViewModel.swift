//
//  AppViewModel.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-25.
//

import SwiftUI
import FirebaseAuth

/// handle login & signout
class AppViewModel: ObservableObject {
    /// login state
    @Published var loggedIn = false
    
    /// ckeck if user is logged in
    var isLoggedIn: Bool {
        // if user is logged in
        if let user = FirebaseManager.shared.auth.currentUser {
            // if user email is varified
            if user.isEmailVerified {
                // user can login
                return true
            }
        }
        return false
    }

    /// signout user
    func signOut() {
        try? FirebaseManager.shared.auth.signOut()
        
        self.loggedIn = false
    }
}
