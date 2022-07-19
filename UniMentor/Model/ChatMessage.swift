//
//  ChatMessage.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-19.
//

import Foundation

// reference: https://www.youtube.com/watch?v=G0AyApE2w1c&list=PL0dzCUj1L5JEN2aWYFCpqfTBeVHcGZjGw&index=13
struct ChatMessage: Identifiable, Codable {
    let id: String
    let toId: String
    let text: String
    let timestamp: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case toId
        case text
        case timestamp
    }
}
