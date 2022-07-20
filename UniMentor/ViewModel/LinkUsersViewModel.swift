//
//  LinkedUsersViewModel.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-14.
//

import Foundation
import FirebaseFirestore
import Firebase

class LinkUsersViewModel: ObservableObject {
    static var selectedUsers = [User]()
    
    func requestUser(user: User?) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            // TODO: error
            print("fail")
            return
        }
        
        guard let user = user else {
            // TODO: error
            return
        }
        
        let userStore = FirebaseManager.shared.firestore.collection("users").document(uid)
        // reference: https://stackoverflow.com/questions/52332758/fieldvalue-arrayunion-and-cloud-firestore-with-flutter
        userStore.updateData([
            "sentRequests": FieldValue.arrayUnion([user.id])
        ])
        
        let receiveUserStore = FirebaseManager.shared.firestore.collection("users").document(user.id)
        receiveUserStore.updateData([
            "recievedRequests": FieldValue.arrayUnion([uid])
        ])
    }
    
    func matchUser(user: User?) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            // TODO: error
            print("fail")
            return
        }
        
        guard let user = user else {
            // TODO: error
            return
        }

        let userStore = FirebaseManager.shared.firestore.collection("users").document(uid)
        userStore.updateData([
            "recievedRequests": FieldValue.arrayRemove([user.id])
        ])
        userStore.updateData([
            "matchedUsers": FieldValue.arrayUnion([user.id])
        ])

        let receiveUserStore = FirebaseManager.shared.firestore.collection("users").document(user.id)
         receiveUserStore.updateData([
            "sentRequests": FieldValue.arrayRemove([uid])
        ])
        receiveUserStore.updateData([
            "matchedUsers": FieldValue.arrayUnion([uid])
        ])
    }
    
    func unmatchUser(user: User?) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            // TODO: error
            print("fail")
            return
        }
        
        guard let user = user else {
            // TODO: error
            return
        }
        
        let userStore = FirebaseManager.shared.firestore.collection("users").document(uid)
        userStore.updateData([
            "matchedUsers": FieldValue.arrayRemove([user.id])
        ])
        let receiveUserStore = FirebaseManager.shared.firestore.collection("users").document(user.id)
        receiveUserStore.updateData([
            "matchedUsers": FieldValue.arrayRemove([uid])
        ])
    }
    
    func declineUser(user: User?) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            // TODO: error
            print("fail")
            return
        }
        
        guard let user = user else {
            // TODO: error
            return
        }
        
        let userStore = FirebaseManager.shared.firestore.collection("users").document(uid)
        userStore.updateData([
            "recievedRequests": FieldValue.arrayRemove([user.id])
        ])

        let receiveUserStore = FirebaseManager.shared.firestore.collection("users").document(user.id)
         receiveUserStore.updateData([
            "sentRequests": FieldValue.arrayRemove([uid])
        ])
    }
}
