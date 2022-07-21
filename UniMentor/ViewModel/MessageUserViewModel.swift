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
                
                documentsSnapshot?.documentChanges.forEach({ change in
                    if change.type == .added {
                        let data = change.document.data()
                        self.messageUsers.append(.init(data: data))
                    }
                    if change.type == .removed {
                        let data = change.document.data()
                        self.messageUsers.removeAll(where: {$0.id == data["id"] as! String})
                    }
                })
            }
    }
}
