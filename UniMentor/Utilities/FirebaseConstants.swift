//
//  FirebaseConstants.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-07-14.
//

import Foundation
import SwiftUI
import Firebase

struct FirebaseConstants {
    
    //this is used for ChatMessageViewModel
    static let fromID = "fromID"
    static let toID = "toID"
    static let text = "text"
    
    //this is used for UserViewModel
    static let uid = "uid"
    static let name = "name"
    static let email = "email"
    //static let profileImageUrl = "profileImageUrl"
    static let password = "password"
    
    //this is used for RecentMessage
    static let timestamp = Timestamp()
}
