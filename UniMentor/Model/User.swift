//
//  User.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-07-07.
//

import Foundation
import FirebaseFirestoreSwift

// reference: https://peterfriese.dev/posts/swiftui-firebase-codable/
struct User: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let major: String
    let school: String
    let startDate: String
    let intro: String

    let matchedUsers: [String]
    let sentRequests: [String]
    let recievedRequests: [String]
    let messageUsers: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case major
        case school
        case startDate
        case intro
        case matchedUsers
        case sentRequests
        case recievedRequests
        case messageUsers
    }
}


