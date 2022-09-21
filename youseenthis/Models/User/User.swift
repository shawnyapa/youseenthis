//
//  User.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/20/22.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String
    var username: String
    var firstName: String
    var lastName: String
    var email: String
    var phoneNumber: String
    var aboutMe: String
    
    
    static func newBlankUser() -> User {
        User(id: UUID().uuidString, username: "", firstName: "", lastName: "", email: "", phoneNumber: "", aboutMe: "")
    }
        
    static func sampleValue() -> User {
        let uuidString = UUID().uuidString
        let user = User(id: uuidString, username: "username", firstName: "First Name", lastName: "Last Name", email: "address@email.com", phoneNumber: "", aboutMe: "")
        return user
    }
}

