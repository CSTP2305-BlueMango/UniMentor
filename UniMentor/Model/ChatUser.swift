//
//  User.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-07-07.
//

import Foundation

struct ChatUser: Identifiable {
    
    //when using Identifiable, something to identify the variable has to be used, eg UID
    var id: String { uid }
    
    let uid, email, name, profileImageUrl: String
    
    
    ///THIS NEEDS TO BE MODIFIED TO BE THE SAME AS SIGN UP PAGE VARIABLE
    //dictionary from ChatMessaging proj (MessagesListView)
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
    }
}
