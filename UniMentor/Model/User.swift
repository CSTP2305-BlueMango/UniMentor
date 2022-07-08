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
    
    let uid, email, profileImageUrl: String
    
    //dictionary from ChatMessaging proj (MessagesListView)
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
    }
}

