//
//  MessageUser.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-19.
//

import Foundation

/// message user model
/// param: message user data
struct MessageUser: Hashable, Identifiable {
    /// message user id
    let id: String
    /// message user name
    let userName: String
    /// message user image
    let userImage: String
    /// message user sent user model id
    let fromId: String
    /// message user latest text
    let text: String
    /// message user latest text timestemp
    let timestamp: String
    
    /// initializing message user data
    init(data: [String: Any]) {
        self.id = data["id"] as? String ?? ""
        self.userName = data["userName"] as? String ?? ""
        self.userImage = data["userImage"] as? String ?? ""
        self.fromId = data["fromId"] as? String ?? ""
        self.text = data["text"] as? String ?? ""
        self.timestamp = data["timestamp"] as? String ?? ""
    }
}
