//
//  ChatMessage.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-19.
//

import Foundation

// reference: https://www.youtube.com/watch?v=G0AyApE2w1c&list=PL0dzCUj1L5JEN2aWYFCpqfTBeVHcGZjGw&index=13
/// chat message model
/// param: document id, chat message data
struct ChatMessage: Identifiable {
    /// message id
    var id: String
    /// message sent user id
    let fromId: String
    /// message receive user id
    let toId: String
    /// message
    let text: String
    /// message sent timestemp
    let timestamp: String

    /// param: document id, chat message data
    init(id: String, data: [String: Any]) {
        self.id = id
        self.fromId = data["fromId"] as? String ?? ""
        self.toId = data["toId"] as? String ?? ""
        self.text = data["text"] as? String ?? ""
        self.timestamp = data["timestamp"] as? String ?? ""
    }
}
