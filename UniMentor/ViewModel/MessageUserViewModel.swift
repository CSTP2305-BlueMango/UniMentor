//
//  MessageUserViewModel.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-19.
//

import Foundation

/// fetch current user all message users
class MessageUserViewModel: ObservableObject {
    /// error message
    @Published var errorMessage = ""
    /// all message users
    @Published var messageUsers = [MessageUser]()
    
    init() {
        fetchMessageUsers()
    }
    
    /// fetch all message users from database
    func fetchMessageUsers() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "fetchMessageUsers: Could not find current uid"
            return
        }
        FirebaseManager.shared.firestore.collection("recent_messages")
            .document(uid).collection("messages").order(by: "time")
            .addSnapshotListener { [self] documentsSnapshot, error in
                if let error = error {
                    self.errorMessage = "fetchMessageUsers: Fail to fetch message user \(error)"
                    return
                }
                // listen for changes in database
                documentsSnapshot?.documentChanges.forEach({ change in
                    // if added
                    if change.type == .added {
                        // get data
                        let data = change.document.data()
                        // add data to messageUsers list as MessageUser
                        self.messageUsers.append(.init(data: data))
                    }
                    // if added
                    if change.type == .modified {
                        // get data
                        let data = change.document.data()
                        // save updated data
                        let updatedData = MessageUser(data: data)
                        // remove previous data from list
                        self.messageUsers.removeAll(where: {$0.id == data["id"] as! String})
                        // append new updated data to the list
                        self.messageUsers.append(updatedData)
                    }
                    // if added
                    if change.type == .removed {
                        // get data
                        let data = change.document.data()
                        // if messageUser in messageUsers list, remove messageUser 
                        self.messageUsers.removeAll(where: {$0.id == data["id"] as! String})
                    }
                })
            }
    }
}
