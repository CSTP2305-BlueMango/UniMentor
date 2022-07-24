//
//  CurrentUserViewModel.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-23.
//

import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI

/// handle logged in user database
class CurrentUserViewModel: ObservableObject {
    /// error message
    @Published var errorMessage = ""
    /// logged in user
    @Published var user: User?
    /// logged in user matched user model list
    @Published var matchedUsersModel: [User] = []
    /// logged in user recieved request user model list
    @Published var recievedRequestsModel: [User] = []
    /// logged in user matched user id list
    @Published var matchedUsers: [String] = []
    /// logged in user sent request user id list
    @Published var sentRequests: [String] = []
    /// logged in user recieved request user id list
    @Published var recievedRequests: [String] = []

    private var handle: AuthStateDidChangeListenerHandle?
    
//    init() {
//        handle = FirebaseManager.shared.auth.addStateDidChangeListener {
//            auth, user in
//            self.fetchCurrentUser()
//        }
//    }
//
//    deinit {
//        guard let handle = handle else {
//            return
//        }
//        FirebaseManager.shared.auth.removeStateDidChangeListener(handle)
//    }
    
    /// fetch logged in user from database
    func fetchCurrentUser() {
        
        // current user id
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "fetchCurrentUser: Could not find firebase uid"
            return
        }
        
        // get user data from database and save as User model
        FirebaseManager.shared.firestore
            .collection("users").document(uid).addSnapshotListener { [self] documentSnapshot, error in
                if let error = error {
                    self.errorMessage = "fetchCurrentUser: Fail to fetch current user: \(error)"
                    return
                }
                
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let newUser = try? documentSnapshot?.data(as: User.self) else {
                    self.errorMessage = "fetchCurrentUser: No user data found"
                    return
                }
                let source = document.metadata.hasPendingWrites ? "Local" : "Server"
                // save user
                self.user = newUser
            }
    }
}
