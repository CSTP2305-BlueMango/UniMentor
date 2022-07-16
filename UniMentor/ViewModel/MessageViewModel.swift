//
//  MessageViewModel.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-07-07.
//

import Foundation

class MessageViewModel: ObservableObject {
    
    @Published var chatUsers = [ChatUser]()
    @Published var errorMessage = ""
    
    init() {
        fetchAllUsers()
    }
    
    //this fetch all users from the collection called chatUsers
    func fetchAllUsers() {
        FirebaseManager.shared.firestore
            .collection("chatUsers")
            .getDocuments{ documentsSnapshot, error in
                if let error = error {
                    print("failed to fetch users: \(error)")
                    return
                }
                
                //this create users here
                documentsSnapshot?.documents.forEach({snapshot in
                    let data = snapshot.data()
                
                    //this ensures that the logged in user is not in the list to message
                    let chatUser = ChatUser(data: data)
                    
                    if chatUser.uid != FirebaseManager.shared.auth.currentUser?.uid {
                        //adds new users to the view from the database
                        self.chatUsers.append(.init(data: data))
                    }
                })
            }
    }
}
