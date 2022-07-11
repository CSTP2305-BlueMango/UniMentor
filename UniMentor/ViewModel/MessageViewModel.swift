//
//  MessageViewModel.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-07-07.
//

import Foundation

class MessageViewModel: ObservableObject {
    
    @Published var users = [ChatUser]()
    @Published var errorMessage = ""
    
    init() {
        fetchAllUsers()
    }
    
    private func fetchAllUsers() {
        FirebaseManager.shared.firestore.collection("users")
            .getDocuments{ documentsSnapshot, err in
                if let err = err {
                    print("failed to fetch users: \(err)")
                    return
                }
                
                //create users here
                documentsSnapshot?.documents.forEach({snapshot in
                    let data = snapshot.data()
                
                    //this ensures that the logged in user is not in the list to message
                    let user = ChatUser(data: data)
                    if user.uid != FirebaseManager.shared.auth.currentUser?.uid {
                        //adds new users from the database
                        self.users.append(.init(data: data))
                    }
                })
            }
    }
}
