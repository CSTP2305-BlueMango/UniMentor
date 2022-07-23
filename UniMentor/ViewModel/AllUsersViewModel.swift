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
    private func fetchAllUsers() {
        FirebaseManager.shared.firestore.collection("users")
            .addSnapshotListener { [self] documentsSnapshot, error in
                if let error = error {
                    self.errorMessage = "fetchAllUsers: Failed to fetch users: \(error)"
                    return
                }
                documentsSnapshot?.documentChanges.forEach({ change in
                    if change.type == .added {
                        guard let user = try? change.document.data(as: User.self) else {
                            self.errorMessage = "fetchAllUsers: No user data found"
                            return
                        }
                        if user.id != FirebaseManager.shared.auth.currentUser?.uid {
                            self.users.append(user)
                        }
                        
                    }
                    if change.type == .modified {
                        guard let user = try? change.document.data(as: User.self) else {
                            self.errorMessage = "fetchAllUsers: No user data found"
                            return
                        }
                        self.users.removeAll(where: {$0.id == user.id as! String})
                    }
                    users.shuffle()

                })
                
//                documentsSnapshot?.documents.forEach({ snapshot in
//                    guard let user = try? snapshot.data(as: User.self) else {
//                        self.errorMessage = "fetchAllUsers: No user data found"
//                        return
//                    }
//
//                    let newUser = user
//                    if newUser.id != FirebaseManager.shared.auth.currentUser?.uid {
//                        self.users.append(newUser)
//                    }
//
//
//
//                })
            }
    }
}
