//
//  MessageUser.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-19.
//

import Foundation

struct MessageUser: Hashable, Identifiable {
    let id: String
    let userName: String
    let userImage: String
    let fromId: String
    let text: String
    let timestamp: String
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case userName
//        case userImage
//        case fromId
//        case text
//        case timestamp
//    }
    
    init(data: [String: Any]) {
        self.id = data["id"] as? String ?? ""
        self.userName = data["userName"] as? String ?? ""
        self.userImage = data["userImage"] as? String ?? ""
        self.fromId = data["fromId"] as? String ?? ""
        self.text = data["text"] as? String ?? ""
        self.timestamp = data["timestamp"] as? String ?? ""
    }
}
