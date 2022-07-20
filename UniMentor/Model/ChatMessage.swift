//
//  ChatMessage.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-19.
//

import Foundation

// reference: https://www.youtube.com/watch?v=G0AyApE2w1c&list=PL0dzCUj1L5JEN2aWYFCpqfTBeVHcGZjGw&index=13
struct ChatMessage: Identifiable {
    var id: String
    let fromId, toId, text: String
    let timestamp: Date

    init(id: String, data: [String: Any]) {
        self.id = id
        self.fromId = data["fromId"] as? String ?? ""
        self.toId = data["toId"] as? String ?? ""
        self.text = data["text"] as? String ?? ""
        self.timestamp = data["timestamp"] as? Date ?? Date()
    }
}
