//
//  UserViewModel.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-14.
//

import Foundation
import FirebaseFirestore

class UserViewModel: ObservableObject {
    @Published var errorMessage = ""
    @Published var user: User?
    @Published var matchedUsersModel: [User] = []
    @Published var sentRequestsModel: [User] = []
    @Published var recievedRequestsModel: [User] = []
    @Published var messageUsersModel: [User] = []
    @Published var matchedUsers: [String] = []
    @Published var sentRequests: [String] = []
    @Published var recievedRequests: [String] = []
    @Published var messageUsers: [String] = []
    
    init() {
        fetchCurrentUser()
    }
    
    private func fetchCurrentUser() {
        
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "Could not find firebase uid"
            return
        }
        
        
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).getDocument { snapshot, error in
                if let error = error {
                    self.errorMessage = "Fail to fetch current user: \(error)"
                    print("Fail to fetch current user: ", error)
                    return
                }
                
                guard let newUser = try? snapshot?.data(as: User.self) else {
                    self.errorMessage = "No data found"
                    return
                }
                
                self.user = newUser
                
                self.matchedUsers = self.user?.matchedUsers ?? []
                self.sentRequests = self.user?.sentRequests ?? []
                self.recievedRequests = self.user?.recievedRequests ?? []
                self.messageUsers = self.user?.messageUsers ?? []
                
                for id in self.matchedUsers {
                    FirebaseManager.shared.firestore
                        .collection("users")
                        .document(id)
                        .getDocument { snapshot, error in
                            if let error = error {
                                self.errorMessage = "Fail to fetch current user: \(error)"
                                print("Fail to fetch current user: ", error)
                                return
                            }
                            
                            guard let newUser = try? snapshot?.data(as: User.self) else {
                                self.errorMessage = "No data found"
                                return
                            }
                            
                            self.matchedUsersModel.append(newUser)
                        }
                }
                
                for id in self.sentRequests {
                    FirebaseManager.shared.firestore
                        .collection("users")
                        .document(id)
                        .getDocument { snapshot, error in
                            if let error = error {
                                self.errorMessage = "Fail to fetch current user: \(error)"
                                print("Fail to fetch current user: ", error)
                                return
                            }
                            
                            guard let newUser = try? snapshot?.data(as: User.self) else {
                                self.errorMessage = "No data found"
                                return
                            }
                            
                            self.sentRequestsModel.append(newUser)
                        }
                }
                
                for id in self.recievedRequests {
                    FirebaseManager.shared.firestore
                        .collection("users")
                        .document(id)
                        .getDocument { snapshot, error in
                            if let error = error {
                                self.errorMessage = "Fail to fetch current user: \(error)"
                                print("Fail to fetch current user: ", error)
                                return
                            }
                            
                            guard let newUser = try? snapshot?.data(as: User.self) else {
                                self.errorMessage = "No data found"
                                return
                            }
                            self.recievedRequestsModel.append(newUser)
                        }
                }
                
                for id in self.messageUsers {
                    FirebaseManager.shared.firestore
                        .collection("users")
                        .document(id)
                        .getDocument { snapshot, error in
                            if let error = error {
                                self.errorMessage = "Fail to fetch current user: \(error)"
                                print("Fail to fetch current user: ", error)
                                return
                            }
                            
                            guard let newUser = try? snapshot?.data(as: User.self) else {
                                self.errorMessage = "No data found"
                                return
                            }
                            self.messageUsersModel.append(newUser)
                        }
                }
            }
    }
    
    func saveUser(createdUser: User) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            print("fail")
            return
        }
        
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
            "recievedRequests": [],
            "messageUsers" : []
        ] as [String : Any]
        
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).setData(newUser) { err in
                if let err = err {
                    print(err)
                    return
                }
                print("Success")
            }
    }
    
    func updateUser(updateUserData: User) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            print("fail")
            return
        }
        
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).updateData([
                "image": updateUserData.image,
                "major": updateUserData.major,
                "school": updateUserData.school,
                "startDate": updateUserData.startDate,
                "intro": updateUserData.intro
            ])
    }

    func deleteUser() {
        guard let user = FirebaseManager.shared.auth.currentUser else {
            print("fail")
            return
        }
        

        
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            // TODO: error
            print("fail")
            return
        }
        
        
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).delete() { error in
                if let error = error {
                    self.errorMessage = "Fail to fetch current user: \(error)"
                    print("Fail to fetch current user: ", error)
                    return
                }
        }
        
        // print("\()")
        for u in matchedUsers {
            print("\(u)")
            let userStore = FirebaseManager.shared.firestore.collection("users").document(u)
            userStore.updateData([
                "matchedUsers": FieldValue.arrayRemove([uid])
            ])
        }

        for u in sentRequests {
            let receiveUserStore = FirebaseManager.shared.firestore.collection("users").document(u)
            receiveUserStore.updateData([
                "recievedRequests": FieldValue.arrayRemove([uid])
            ])
        }
        
        for u in messageUsers {
            let receiveUserStore = FirebaseManager.shared.firestore.collection("users").document(u)
            receiveUserStore.updateData([
                "messageUsers": FieldValue.arrayRemove([uid])
            ])
        }
        
        user.delete() { error in
            if let error = error {
                self.errorMessage = "Fail to fetch current user: \(error)"
                print("Fail to fetch current user: ", error)
                return
            }
        }
        
    }
}
