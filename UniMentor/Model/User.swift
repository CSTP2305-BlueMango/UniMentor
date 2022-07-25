//
//  User.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-07-07.
//

import Foundation
import FirebaseFirestoreSwift

// reference: https://peterfriese.dev/posts/swiftui-firebase-codable/
/// user model
struct User: Identifiable, Codable {
    /// user id
    let id: String
    /// user name
    let name: String
    /// user image
    let image: String
    /// user major
    let major: String
    /// user school
    let school: String
    /// user start date
    let startDate: String
    /// user information
    let intro: String

    /// user matched users list
    let matchedUsers: [String]
    /// user sent request users list
    let sentRequests: [String]
    /// user received request users list
    let recievedRequests: [String]
    
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
    }
}


