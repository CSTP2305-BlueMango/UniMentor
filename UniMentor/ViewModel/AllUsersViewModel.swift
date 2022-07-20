//
//  MessageViewModel.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-07-07.
//

import Foundation
import FirebaseFirestore
import Firebase

class AllUsersViewModel: ObservableObject {
    
    @Published var users = [User]()
    @Published var errorMessage = ""
    
    init() {
        fetchAllUsers()
    }
    
    private func fetchAllUsers() {
        FirebaseManager.shared.firestore.collection("users")
            .addSnapshotListener { [self] documentsSnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to fetch users: \(error)"
                    print("Failed to fetch users: \(error)")
                    return
                }
                
                documentsSnapshot?.documents.forEach({ snapshot in
                    
                    guard let user = try? snapshot.data(as: User.self) else {
                        self.errorMessage = "No data found"
                        return
                    }
                    
                    let newUser = user
                    
                    if newUser.id != FirebaseManager.shared.auth.currentUser?.uid {
                        self.users.append(newUser)
                    }
                    users.shuffle()
                })
            }
    }
}
