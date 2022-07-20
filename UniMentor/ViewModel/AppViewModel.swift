//
//  AppViewModel.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-25.
//

import SwiftUI
import FirebaseAuth
import Firebase

class AppViewModel: ObservableObject {
    
    @Published var loggedIn = false
    
    var isLoggedIn: Bool {
        if let user = FirebaseManager.shared.auth.currentUser {
            if user.isEmailVerified {
                return true
            }
        }
        return false
        // return auth.currentUser != nil
    }

    func signOut() {
        try? FirebaseManager.shared.auth.signOut()
        
        self.loggedIn = false
    }
}
