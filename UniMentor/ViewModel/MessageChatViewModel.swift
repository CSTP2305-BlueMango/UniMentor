//
//  MessageChatViewModel.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-07-14.
//

import SwiftUI
import Firebase

class MessageChatViewModel {
    
    @Published var errorMessage = ""
//    @Published var chatUser: ChatUser?

    init() {
        fetchCurrentUser()
    }
    
    //this is to fetch the user currently logged in
    private func fetchCurrentUser() {
        //self.errorMessage = "fetching data"
        
        //pull the current uid from the database
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "Could not find firebase userID"
            return }
        
        //fetch the current user logged in
        //self.errorMessage = "\(uid)"
        FirebaseManager.shared.firestore
            .collection("signUpUsers")
            .document(uid)
            .getDocument { snapshot, error in
            if let error = error {
                self.errorMessage = "Failed to fetch current user: \(error)"
                print("Failed to fetch current user:", error)
                return
            }

            //get the user snapshot
            //data dictionary, extra information from the database
//            guard let data = snapshot?.data() else {
//                self.errorMessage = "No data found"
//                return }
//
            //dictonary for the chatUser
//            self.chatUser = .init(data: data)
        }
    }
}


