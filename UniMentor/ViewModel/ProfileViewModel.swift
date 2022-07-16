//
//  ProfileViewModel.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-07-01.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var major: String = ""
    @Published var school: String = ""
    @Published var startDate: Date = Date.now
    @Published var info: String = ""
    @Published var image = Data()
    
    @Published var about: String = ""
    
    
    func storeUserInfo() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            return
        }
        
        //create the dictionary, this is what will be stored in the database
        let userInfo = ["major": self.major, "school": self.school, "startDate": self.startDate, "about": self.about] as [String : Any]
        
        //this makes the collection of users into the firestore database
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).setData(userInfo) { err in
                if let err = err {
                    print(err)
                    return
                }
            }
    }
    
}
