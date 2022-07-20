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
    static var selectedMessageUsers = [MessageUser]()
    
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
        
        let userMessage = FirebaseManager.shared.firestore.collection("messages").document(uid).collection(user.id)
        userMessage.getDocuments { snapshopt, error in
            snapshopt?.documents.forEach({ s in
                FirebaseManager.shared.firestore.collection("messages")
                    .document(uid).collection(user.id).document(s.documentID).delete() { err in
                    if let err = err {
                        print("Error removing document: \(err)")
                    } else {
                        print("Document successfully removed!")
                    }
                }
            })
        }
        
        let receiverMessage = FirebaseManager.shared.firestore.collection("messages").document(user.id).collection(uid)
        receiverMessage.getDocuments { snapshopt, error in
            snapshopt?.documents.forEach({ s in
                FirebaseManager.shared.firestore.collection("messages")
                    .document(user.id).collection(uid).document(s.documentID).delete() { err in
                    if let err = err {
                        print("Error removing document: \(err)")
                    } else {
                        print("Document successfully removed!")
                    }
                }
            })
        }
        
        let userMessageUser = FirebaseManager.shared.firestore.collection("resent_messages").document(uid).collection("messages")
        userMessageUser.getDocuments { snapshopt, error in
            snapshopt?.documents.forEach({ s in
                FirebaseManager.shared.firestore.collection("resent_messages")
                    .document(uid).collection("messages").document(user.id).delete() { err in
                    if let err = err {
                        print("Error removing document: \(err)")
                    } else {
                        print("Document successfully removed!")
                    }
                }
            })
        }
        
        let receiverUserMessageUser = FirebaseManager.shared.firestore.collection("resent_messages").document(user.id).collection("messages")
        receiverUserMessageUser.getDocuments { snapshopt, error in
            snapshopt?.documents.forEach({ s in
                FirebaseManager.shared.firestore.collection("resent_messages")
                    .document(user.id).collection("messages").document(uid).delete() { err in
                    if let err = err {
                        print("Error removing document: \(err)")
                    } else {
                        print("Document successfully removed!")
                    }
                }
            })
        }
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
    
    func deleteMessages(user: MessageUser?) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            // TODO: error
            print("fail")
            return
        }
        
        guard let user = user else {
            // TODO: error
            return
        }
        
        let userMessage = FirebaseManager.shared.firestore.collection("messages").document(uid).collection(user.id)
        userMessage.getDocuments { snapshopt, error in
            snapshopt?.documents.forEach({ s in
                FirebaseManager.shared.firestore.collection("messages")
                    .document(uid).collection(user.id).document(s.documentID).delete() { err in
                    if let err = err {
                        print("Error removing document: \(err)")
                    } else {
                        print("Document successfully removed!")
                    }
                }
            })
        }
        
        let receiverMessage = FirebaseManager.shared.firestore.collection("messages").document(user.id).collection(uid)
        receiverMessage.getDocuments { snapshopt, error in
            snapshopt?.documents.forEach({ s in
                FirebaseManager.shared.firestore.collection("messages")
                    .document(user.id).collection(uid).document(s.documentID).delete() { err in
                    if let err = err {
                        print("Error removing document: \(err)")
                    } else {
                        print("Document successfully removed!")
                    }
                }
            })
        }
        
        let userMessageUser = FirebaseManager.shared.firestore.collection("resent_messages").document(uid).collection("messages")
        userMessageUser.getDocuments { snapshopt, error in
            snapshopt?.documents.forEach({ s in
                FirebaseManager.shared.firestore.collection("resent_messages")
                    .document(uid).collection("messages").document(user.id).delete() { err in
                    if let err = err {
                        print("Error removing document: \(err)")
                    } else {
                        print("Document successfully removed!")
                    }
                }
            })
        }
        
        let receiverUserMessageUser = FirebaseManager.shared.firestore.collection("resent_messages").document(user.id).collection("messages")
        receiverUserMessageUser.getDocuments { snapshopt, error in
            snapshopt?.documents.forEach({ s in
                FirebaseManager.shared.firestore.collection("resent_messages")
                    .document(user.id).collection("messages").document(uid).delete() { err in
                    if let err = err {
                        print("Error removing document: \(err)")
                    } else {
                        print("Document successfully removed!")
                    }
                }
            })
        }
    }

}
