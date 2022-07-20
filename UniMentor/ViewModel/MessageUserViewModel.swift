//
//  MessageUserViewModel.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-19.
//

import Foundation

class MessageUserViewModel: ObservableObject {
    @Published var errorMessage = ""
    @Published var messageUsers = [MessageUser]()
    
    init() {
        fetchMessageUsers()
    }
    
    func fetchMessageUsers() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            print("Could not find firebase uid")
            return
        }
        FirebaseManager.shared.firestore.collection("resent_messages")
            .document(uid).collection("messages")
            .addSnapshotListener { [self] documentsSnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to fetch users: \(error)"
                    print("Failed to fetch users: \(error)")
                    return
                }
                print("test")
                
                documentsSnapshot?.documentChanges.forEach({ change in
                    if change.type == .added {
                        let data = change.document.data()
                        print(data["timestamp"])
                        self.messageUsers.append(.init(data: data))
                    }
                })
            }
    }

}
