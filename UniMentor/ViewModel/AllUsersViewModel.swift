//
//  MessageViewModel.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-07-07.
//

import Foundation
import FirebaseFirestore
import Firebase

/// fetch all users from database
class AllUsersViewModel: ObservableObject {
    /// error message
    @Published var errorMessage = ""
    /// all users list
    @Published var users = [User]()
    
    init() {
        fetchAllUsers()
    }
    
    /// fetch all users
    func fetchAllUsers() {
        // reset users list
        users = []
        FirebaseManager.shared.firestore.collection("users")
            .addSnapshotListener { [self] documentsSnapshot, error in
                if let error = error {
                    self.errorMessage = "fetchAllUsers: Failed to fetch users: \(error)"
                    return
                }
                // listen for changes in database
                documentsSnapshot?.documentChanges.forEach({ change in
                    // if added
                    if change.type == .added {
                        // get user as User model
                        guard let user = try? change.document.data(as: User.self) else {
                            self.errorMessage = "fetchAllUsers: No user data found"
                            return
                        }
                        // if user is not current user
                        if user.id != FirebaseManager.shared.auth.currentUser?.uid {
                            // append user to users list
                            self.users.append(user)
                        }
                    }
                    // if modified
                    if change.type == .modified {
                        // get user as User model
                        guard let user = try? change.document.data(as: User.self) else {
                            self.errorMessage = "fetchAllUsers: No user data found"
                            return
                        }
                        // remove user from users list
                        self.users.removeAll(where: {$0.id == user.id})
                    }
                    if change.type == .removed {
                        // get user as User model
                        guard let user = try? change.document.data(as: User.self) else {
                            self.errorMessage = "fetchAllUsers: No user data found"
                            return
                        }
                        // remove user from users list
                        self.users.removeAll(where: {$0.id == user.id})
                    }
                    // shuffle users list
                    users.shuffle()
                })
            }
    }
}
