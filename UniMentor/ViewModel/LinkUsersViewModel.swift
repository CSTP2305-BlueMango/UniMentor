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
    func requestUser(user: User?) {
        guard let uid = Auth.auth().currentUser?.uid else {
            // TODO: error
            print("fail")
            return
        }
        
        guard let user = user else {
            // TODO: error
            return
        }
        
        let userStore = Firestore.firestore().collection("users").document(uid)
        // reference: https://stackoverflow.com/questions/52332758/fieldvalue-arrayunion-and-cloud-firestore-with-flutter
        userStore.updateData([
            "sentRequests": FieldValue.arrayUnion([user.id])
        ])
        
        let receiveUserStore = Firestore.firestore().collection("users").document(user.id)
        receiveUserStore.updateData([
            "recievedRequests": FieldValue.arrayUnion([uid])
        ])
    }
    
    func matchUser(user: User?) {
        guard let uid = Auth.auth().currentUser?.uid else {
            // TODO: error
            print("fail")
            return
        }
        
        guard let user = user else {
            // TODO: error
            return
        }

        let userStore = Firestore.firestore().collection("users").document(uid)
        userStore.updateData([
            "recievedRequests": FieldValue.arrayRemove([user.id])
        ])
        userStore.updateData([
            "matchedUsers": FieldValue.arrayUnion([user.id])
        ])

        let receiveUserStore = Firestore.firestore().collection("users").document(user.id)
         receiveUserStore.updateData([
            "sentRequests": FieldValue.arrayRemove([uid])
        ])
        receiveUserStore.updateData([
            "matchedUsers": FieldValue.arrayUnion([uid])
        ])
    }
    
    func unmatchUser(user: User?) {
        guard let uid = Auth.auth().currentUser?.uid else {
            // TODO: error
            print("fail")
            return
        }
        
        guard let user = user else {
            // TODO: error
            return
        }
        
        let userStore = Firestore.firestore().collection("users").document(uid)
        userStore.updateData([
            "matchedUsers": FieldValue.arrayRemove([user.id]),
            "messageUsers": FieldValue.arrayRemove([user.id])
        ])
        let receiveUserStore = Firestore.firestore().collection("users").document(user.id)
        receiveUserStore.updateData([
            "matchedUsers": FieldValue.arrayRemove([uid]),
            "messageUsers": FieldValue.arrayRemove([uid])
        ])
    }
    
    func declineUser(user: User?) {
        guard let uid = Auth.auth().currentUser?.uid else {
            // TODO: error
            print("fail")
            return
        }
        
        guard let user = user else {
            // TODO: error
            return
        }
        
        let userStore = Firestore.firestore().collection("users").document(uid)
        userStore.updateData([
            "recievedRequests": FieldValue.arrayRemove([user.id])
        ])

        let receiveUserStore = Firestore.firestore().collection("users").document(user.id)
         receiveUserStore.updateData([
            "sentRequests": FieldValue.arrayRemove([uid])
        ])
    }
    
    func messageUser(user: User?, matchedUserList: [String]) {
        guard let uid = Auth.auth().currentUser?.uid else {
            // TODO: error
            print("fail")
            return
        }
        guard let user = user else {
            // TODO: error
            return
        }
        
        guard matchedUserList.contains(user.id) else {
            // TODO: error
            return
        }
        
        let userStore = Firestore.firestore().collection("users").document(uid)
        userStore.updateData([
            "messageUsers": FieldValue.arrayUnion([user.id])
        ])
        let receiveUserStore = Firestore.firestore().collection("users").document(user.id)
        receiveUserStore.updateData([
            "messageUsers": FieldValue.arrayUnion([uid])
        ])
    }
}
