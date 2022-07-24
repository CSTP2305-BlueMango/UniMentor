//
//  UserViewModel.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-14.
//

import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI

/// handle logged in user database
class UserViewModel: ObservableObject {
    /// error message
    @Published var errorMessage = ""
    /// logged in user
    @Published var user: User?
    /// logged in user matched user model list
    @Published var matchedUsersModel: [User] = []
    /// logged in user recieved request user model list
    @Published var recievedRequestsModel: [User] = []
    /// logged in user matched user id list
    @Published var matchedUsers: [String] = []
    /// logged in user sent request user id list
    @Published var sentRequests: [String] = []
    /// logged in user recieved request user id list
    @Published var recievedRequests: [String] = []

    private var handle: AuthStateDidChangeListenerHandle?
    
    init() {
        handle = FirebaseManager.shared.auth.addStateDidChangeListener {
            auth, user in
            self.fetchCurrentUser()
        }
    }

    deinit {
        guard let handle = handle else {
            return
        }
        FirebaseManager.shared.auth.removeStateDidChangeListener(handle)
    }
    
    /// fetch logged in user from database
    func fetchCurrentUser() {
        
        // current user id
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "fetchCurrentUser: Could not find firebase uid"
            return
        }
        
        // get user data from database and save as User model
        FirebaseManager.shared.firestore
            .collection("users").document(uid).addSnapshotListener { [self] documentSnapshot, error in
                if let error = error {
                    self.errorMessage = "fetchCurrentUser: Fail to fetch current user: \(error)"
                    return
                }
                
                // get current user from database as User model
                guard let newUser = try? documentSnapshot?.data(as: User.self) else {
                    self.errorMessage = "fetchCurrentUser: No user data found"
                    return
                }
                
                // save user
                self.user = newUser
                
                // save user linked users lists
                self.matchedUsers = self.user?.matchedUsers ?? []
                self.sentRequests = self.user?.sentRequests ?? []
                self.recievedRequests = self.user?.recievedRequests ?? []
                
                // get matched & requested user models of current user
                FirebaseManager.shared.firestore.collection("users")
                    .addSnapshotListener { [self] documentsSnapshot, error in
                        if let error = error {
                            self.errorMessage = "fetchAllUsers: Failed to fetch users: \(error)"
                            return
                        }
                        // loop through all users in database
                        documentsSnapshot?.documentChanges.forEach({ change in
                            // if document change type is added
                            if change.type == .added {
                                // get user as User model
                                guard let getuser = try? change.document.data(as: User.self) else {
                                    self.errorMessage = "fetchAllUsers: No user data found"
                                    return
                                }
                                // if user is matched with current user
                                if self.matchedUsers.contains(getuser.id) {
                                    // if user is not in matched users model list
                                    if !self.matchedUsersModel.contains(where: {$0.id == getuser.id}) {
                                        // add user to matched users model list of current user
                                        self.matchedUsersModel.append(getuser)
                                    }
                                }
                                // if user sent request to current user
                                if self.recievedRequests.contains(getuser.id) {
                                    // if user is not in recieved users model list
                                    if !self.recievedRequestsModel.contains(where: {$0.id == getuser.id}) {
                                        // add user to recieved users model list of current user
                                        self.recievedRequestsModel.append(getuser)
                                    }
                                }
                            }
                            // if document change type is moditied
                            if change.type == .modified {
                                // get user as User model
                                guard let getuser = try? change.document.data(as: User.self) else {
                                    self.errorMessage = "fetchAllUsers: No user data found"
                                    return
                                }
                                // if user is matched with current user
                                if self.matchedUsers.contains(getuser.id) {
                                    // remove user from matched users model list of current user
                                    self.matchedUsersModel.removeAll(where: {$0.id == getuser.id})
                                }
                                // if user sent request to current user
                                if self.recievedRequests.contains(getuser.id) {
                                    // remove user from recieved users model list of current user
                                    self.recievedRequestsModel.removeAll(where: {$0.id == getuser.id})
                                }
                            }
                        })
                    }
            }
    }
    
    /// save user data to database
    /// param: new User model
    func saveUser(createdUser: User) {
        // current user id
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "saveUser: Fail to fetch current user id"
            return
        }
        
        // new user data
        let newUser = [
            "id": uid,
            "name": createdUser.name,
            "image": createdUser.image,
            "major": createdUser.major,
            "school": createdUser.school,
            "startDate": createdUser.startDate,
            "intro": createdUser.intro,
        
            "matchedUsers": [],
            "sentRequests": [],
            "recievedRequests": []
        ] as [String : Any]
        
        // save new user to database
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).setData(newUser) { error in
                if let error = error {
                    self.errorMessage = "saveUser: Fail to fetch recieve request user: \(error)"
                    return
                }
            }
    }
    
    /// update user data to database
    /// param: updated User model
    func updateUser(updateUserData: User) {
        // current user id
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "updateUser: Fail to fetch current user id"
            return
        }
        
        // update user data
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).updateData([
                "name": updateUserData.name,
                "image": updateUserData.image,
                "major": updateUserData.major,
                "school": updateUserData.school,
                "startDate": updateUserData.startDate,
                "intro": updateUserData.intro
            ])
    }

    /// delete user account
    func deleteUser() {
        // current user
        guard let user = FirebaseManager.shared.auth.currentUser else {
            self.errorMessage = "deleteUser: Fail to fetch current user"
            return
        }
        // current user id
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "deleteUser: Fail to fetch current user id"
            return
        }
        
        // delete user sent & recieved messages
        for u in matchedUsers {
            // delete sent messages
            FirebaseManager.shared.firestore.collection("messages")
                .document(u).collection(uid).getDocuments { snapshot, error in
                    if let error = error {
                        self.errorMessage = "deleteUser: Fail to fetch messages data: \(error)"
                        return
                    }
                    // delete all message in user recieved messages
                    snapshot?.documents.forEach({ ss in
                        FirebaseManager.shared.firestore.collection("messages")
                            .document(u).collection(uid).document(ss.documentID).delete() { error in
                            if let error = error {
                                self.errorMessage = "deleteUser: Fail to delete sent messages data: \(error)"
                            }
                        }
                    })
            }
            // delete recieved messages
            FirebaseManager.shared.firestore.collection("messages")
                .document(uid).collection(u).getDocuments { snapshot, error in
                    if let error = error {
                        self.errorMessage = "deleteUser: Fail to fetch messages data: \(error)"
                        return
                    }
                    // delete all message in recieve user recieved messages
                    snapshot?.documents.forEach({ ss in
                        FirebaseManager.shared.firestore.collection("messages")
                            .document(uid).collection(u).document(ss.documentID).delete() { error in
                            if let error = error {
                                self.errorMessage = "deleteUser: Fail to delete recieved messages data: \(error)"
                            }
                        }
                    })
            }
        }
        
        // delete user recent message data
        for u in matchedUsers {
            // delete sent messages
            FirebaseManager.shared.firestore.collection("recent_messages")
                .document(u).collection("messages").getDocuments { snapshot, error in
                    if let error = error {
                        self.errorMessage = "deleteUser: Fail to fetch recent sent messages data: \(error)"
                        return
                    }
                    // delete recent message in user recieved messages
                    snapshot?.documents.forEach({ ss in
                        FirebaseManager.shared.firestore.collection("recent_messages")
                            .document(u).collection("messages").document(uid).delete() { error in
                            if let error = error {
                                self.errorMessage = "deleteUser: Fail to delete recent sent messages data: \(error)"
                            }
                        }
                    })
                
            }
            // delete recieved messages
            FirebaseManager.shared.firestore.collection("recent_messages")
                .document(uid).collection("messages").getDocuments { snapshot, error in
                    if let error = error {
                        self.errorMessage = "deleteUser: Fail to fetch recent recieved messages data: \(error)"
                        return
                    }
                    // delete recent message in recieve user recieved messages
                    snapshot?.documents.forEach({ ss in
                        FirebaseManager.shared.firestore.collection("recent_messages")
                            .document(uid).collection("messages").document(u).delete() { error in
                            if let error = error {
                                self.errorMessage = "deleteUser: Fail to delete recent recieved messages data: \(error)"
                            }
                        }
                    })
                
            }
        }
        
        // delete current user model
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).delete() { error in
                if let error = error {
                    self.errorMessage = "deleteUser: Fail to fetch current user model: \(error)"
                    return
                }
        }

        // delete matched information
        for u in matchedUsers {
            let userStore = FirebaseManager.shared.firestore.collection("users").document(u)
            userStore.updateData([
                "matchedUsers": FieldValue.arrayRemove([uid])
            ])
        }
        // delete request information
        for u in sentRequests {
            let receiveUserStore = FirebaseManager.shared.firestore.collection("users").document(u)
            receiveUserStore.updateData([
                "recievedRequests": FieldValue.arrayRemove([uid])
            ])
        }

        // delete user auth
        user.delete() { error in
            if let error = error {
                self.errorMessage = "deleteUser: Fail to delete current user: \(error)"
                return
            }
        }
    }
    
    /// save new message user
    /// param: new message user: User
    func saveMessageUser(messageuser: User?) {
        // current user id
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "saveMessageUser: Could not find current uid"
            return
        }
        // sending user
        guard let toId = messageuser else {
            self.errorMessage = "saveMessageUser: Could not find message user"
            return
        }
        
        // save sending user to current user
        let document = FirebaseManager.shared.firestore.collection("recent_messages")
            .document(uid).collection("messages").document(toId.id)
        
        // new message user data
        let data = [
            "fromId": uid,
            "id": toId.id,
            "text": "",
            "timestamp": "",
            "userImage": messageuser?.image ?? "",
            "userName": messageuser?.name ?? "",
            "time": Date()
        ] as [String : Any]
        
        // save data to database
        document.setData(data) { error in
            if let error = error {
                self.errorMessage = "saveMessageUser: Fail to save message user model: \(error)"
                return
            }
        }
        
        // save current user to sending user
        let recievedDocument = FirebaseManager.shared.firestore.collection("recent_messages")
            .document(toId.id).collection("messages").document(uid)
        
        // new message user data
        let recieveddata = [
            "fromId": toId.id,
            "id": uid,
            "text": "",
            "timestamp": getTime(),
            "userImage": self.user?.image ?? "",
            "userName": self.user?.name ?? "",
            "time": Date()
        ] as [String : Any]
        
        // save data to database
        recievedDocument.setData(recieveddata) { error in
            if let error = error {
                self.errorMessage = "saveMessageUser: Fail to save message user model: \(error)"
                return
            }
        }
    }
    
    // reference: https://mammothinteractive.com/get-current-time-with-swiftui-hacking-swift-5-5-xcode-13-and-ios-15/
    /// handle timestemp
    /// return: formatted time: String
    func getTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        let dateString = dateFormatter.string(from: Date())
        return dateString
    }
}
