//
//  LinkedUsersViewModel.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-14.
//

import Foundation
import FirebaseFirestore
import Firebase

/// handle link users
class LinkUsersViewModel: ObservableObject {
    /// error message
    @Published var errorMessage = ""
    /// selected user list for unmatch users
    static var selectedUsers = [User]()
    /// selected messageUser list for delete messages of users
    static var selectedMessageUsers = [MessageUser]()
    
    /// send match request to other user
    /// param: requesting user: User
    func requestUser(user: User?) {
        // current user id
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "requestUser: Could not find current uid"
            return
        }
        // requesting user
        guard let user = user else {
            self.errorMessage = "requestUser: Could not find requesting user parameter"
            return
        }
        
        // save sending request user id to current user data
        let userStore = FirebaseManager.shared.firestore.collection("users").document(uid)
        // reference: https://stackoverflow.com/questions/52332758/fieldvalue-arrayunion-and-cloud-firestore-with-flutter
        userStore.updateData([
            "sentRequests": FieldValue.arrayUnion([user.id])
        ])
        
        // save current user data to sending request user data
        let receiveUserStore = FirebaseManager.shared.firestore.collection("users").document(user.id)
        receiveUserStore.updateData([
            "recievedRequests": FieldValue.arrayUnion([uid])
        ])
    }
    
    /// match user
    /// param: match user: User
    func matchUser(user: User?) {
        // current user id
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "matchUser: Could not find current uid"
            return
        }
        // matching user
        guard let user = user else {
            self.errorMessage = "matchUser: Could not find matching user parameter"
            return
        }

        // remove id from recieved data and add id to matched data
        let userStore = FirebaseManager.shared.firestore.collection("users").document(uid)
        userStore.updateData([
            "recievedRequests": FieldValue.arrayRemove([user.id])
        ])
        userStore.updateData([
            "matchedUsers": FieldValue.arrayUnion([user.id])
        ])

        // remove id from sent data and add id to matched data
        let receiveUserStore = FirebaseManager.shared.firestore.collection("users").document(user.id)
        receiveUserStore.updateData([
            "sentRequests": FieldValue.arrayRemove([uid])
        ])
        receiveUserStore.updateData([
            "matchedUsers": FieldValue.arrayUnion([uid])
        ])
    }
    
    /// unmatch user
    /// param: unmatch user: User
    func unmatchUser(user: User?) {
        // current user id
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "unmatchUser: Could not find current uid"
            return
        }
        // unmatching user
        guard let user = user else {
            self.errorMessage = "unmatchUser: Could not find unmatching user parameter"
            return
        }
        
        // remove user id from matched data
        let userStore = FirebaseManager.shared.firestore.collection("users").document(uid)
        userStore.updateData([
            "matchedUsers": FieldValue.arrayRemove([user.id])
        ])
        let receiveUserStore = FirebaseManager.shared.firestore.collection("users").document(user.id)
        receiveUserStore.updateData([
            "matchedUsers": FieldValue.arrayRemove([uid])
        ])
        
        // remove messages from current user
        let userMessage = FirebaseManager.shared.firestore.collection("messages").document(uid).collection(user.id)
        userMessage.getDocuments { snapshopt, error in
            if let error = error {
                self.errorMessage = "unmatchUser: Fail to get messages documents from user: \(error)"
                return
            }
            snapshopt?.documents.forEach({ s in
                FirebaseManager.shared.firestore.collection("messages")
                    .document(uid).collection(user.id).document(s.documentID).delete() { error in
                    if let error = error {
                        self.errorMessage = "unmatchUser: Fail to delete messages \(error)"
                    }
                }
            })
        }
        // remove messages from unmatching user
        let receiverMessage = FirebaseManager.shared.firestore.collection("messages").document(user.id).collection(uid)
        receiverMessage.getDocuments { snapshopt, error in
            if let error = error {
                self.errorMessage = "unmatchUser: Fail to get messages documents from unmatching user: \(error)"
                return
            }
            snapshopt?.documents.forEach({ s in
                FirebaseManager.shared.firestore.collection("messages")
                    .document(user.id).collection(uid).document(s.documentID).delete() { error in
                    if let error = error {
                        self.errorMessage = "unmatchUser: Fail to delete messages \(error)"
                    }
                }
            })
        }
        
        // remove recent message data from current user
        let userMessageUser = FirebaseManager.shared.firestore.collection("recent_messages").document(uid).collection("messages")
        userMessageUser.getDocuments { snapshopt, error in
            if let error = error {
                self.errorMessage = "unmatchUser: Fail to get recent messages documents from current user: \(error)"
                return
            }
            snapshopt?.documents.forEach({ s in
                FirebaseManager.shared.firestore.collection("recent_messages")
                    .document(uid).collection("messages").document(user.id).delete() { error in
                    if let error = error {
                        self.errorMessage = "unmatchUser: Fail to delete recent messages \(error)"
                    }
                }
            })
        }
        // remove recent message data from unmatching user
        let receiverUserMessageUser = FirebaseManager.shared.firestore.collection("recent_messages").document(user.id).collection("messages")
        receiverUserMessageUser.getDocuments { snapshopt, error in
            if let error = error {
                self.errorMessage = "unmatchUser: Fail to get recent messages documents from unmatching user: \(error)"
                return
            }
            snapshopt?.documents.forEach({ s in
                FirebaseManager.shared.firestore.collection("recent_messages")
                    .document(user.id).collection("messages").document(uid).delete() { error in
                    if let error = error {
                        self.errorMessage = "unmatchUser: Fail to delete recent messages \(error)"
                    }
                }
            })
        }
    }
    
    /// decline match request
    /// param: decline user: User
    func declineUser(user: User?) {
        // current user id
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "declineUser: Could not find current uid"
            return
        }
        // declining user
        guard let user = user else {
            self.errorMessage = "declineUser: Could not find declining user parameter"
            return
        }
        
        // remove recieved request data from declining user
        let userStore = FirebaseManager.shared.firestore.collection("users").document(uid)
        userStore.updateData([
            "recievedRequests": FieldValue.arrayRemove([user.id])
        ])
        // remove sent request data from current user
        let receiveUserStore = FirebaseManager.shared.firestore.collection("users").document(user.id)
         receiveUserStore.updateData([
            "sentRequests": FieldValue.arrayRemove([uid])
        ])
    }
    
    /// delete messages
    /// param: delete message user: MessageUser
    func deleteMessages(user: MessageUser?) {
        // current user id
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "deleteMessages: Could not find current uid"
            return
        }
        // declining user
        guard let user = user else {
            self.errorMessage = "deleteMessages: Could not find declining user parameter"
            return
        }
        
        // delete messages from user
        let userMessage = FirebaseManager.shared.firestore.collection("messages").document(uid).collection(user.id)
        userMessage.getDocuments { snapshopt, error in
            if let error = error {
                self.errorMessage = "deleteMessages: Fail to get messages documents from user: \(error)"
                return
            }
            snapshopt?.documents.forEach({ s in
                FirebaseManager.shared.firestore.collection("messages")
                    .document(uid).collection(user.id).document(s.documentID).delete() { error in
                    if let error = error {
                        self.errorMessage = "deleteMessages: Fail to delete messages \(error)"
                    }
                }
            })
        }
        
        // delete messages from deleting user
        let receiverMessage = FirebaseManager.shared.firestore.collection("messages").document(user.id).collection(uid)
        receiverMessage.getDocuments { snapshopt, error in
            if let error = error {
                self.errorMessage = "deleteMessages: Fail to get messages documents from deleting user: \(error)"
                return
            }
            snapshopt?.documents.forEach({ s in
                FirebaseManager.shared.firestore.collection("messages")
                    .document(user.id).collection(uid).document(s.documentID).delete() { error in
                    if let error = error {
                        self.errorMessage = "deleteMessages: Fail to delete messages \(error)"
                    }
                }
            })
        }
        
        // delete recent messages from user
        let userMessageUser = FirebaseManager.shared.firestore.collection("recent_messages").document(uid).collection("messages")
        userMessageUser.getDocuments { snapshopt, error in
            if let error = error {
                self.errorMessage = "deleteMessages: Fail to get recent messages documents from current user: \(error)"
                return
            }
            snapshopt?.documents.forEach({ s in
                FirebaseManager.shared.firestore.collection("recent_messages")
                    .document(uid).collection("messages").document(user.id).delete() { error in
                    if let error = error {
                        self.errorMessage = "deleteMessages: Fail to delete recent messages \(error)"
                    }
                }
            })
        }
        
        // delete recent messages from deleting user
        let receiverUserMessageUser = FirebaseManager.shared.firestore.collection("recent_messages").document(user.id).collection("messages")
        receiverUserMessageUser.getDocuments { snapshopt, error in
            if let error = error {
                self.errorMessage = "deleteMessages: Fail to get recent messages documents from deleting user: \(error)"
                return
            }
            snapshopt?.documents.forEach({ s in
                FirebaseManager.shared.firestore.collection("recent_messages")
                    .document(user.id).collection("messages").document(uid).delete() { error in
                    if let error = error {
                        self.errorMessage = "deleteMessages: Fail to delete recent messages \(error)"
                    }
                }
            })
        }
    }
}
