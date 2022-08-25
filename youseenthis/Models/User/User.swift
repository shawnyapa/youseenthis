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
    var aboutMe: String
    
    func savePrimaryUser(user: User) -> Bool {
        StorageManager.savePrimaryUser(user: user)
        return true
    }
    
    static func newBlankUser() -> User {
       User(id: UUID().uuidString, username: "", firstName: "", lastName: "", email: "", aboutMe: "")
    }
    
    static func primaryUser() -> User? {
        let primaryUser = StorageManager.getPrimaryUser()
        return primaryUser
    }
    
    static func sampleValue() -> User {
        let uuidString = UUID().uuidString
        let user = User(id: uuidString, username: "username", firstName: "First Name", lastName: "Last Name", email: "address@email.com", aboutMe: "")
        return user
    }
}

