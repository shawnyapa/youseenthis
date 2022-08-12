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
    
    func saveCurrentUser() -> Bool {
        StorageManager.saveCurrentUser(user: self)
        return true
    }
    
    static func newBlankUser() -> User {
       User(id: UUID().uuidString, username: "", firstName: "", lastName: "", email: "")
    }
    
    static func currentUser() -> User? {
        let currentUser = StorageManager.getCurrentUser()
        return currentUser
    }
    
    static func sampleValue() -> User {
        let uuidString = UUID().uuidString
        let user = User(id: uuidString, username: "username", firstName: "First Name", lastName: "Last Name", email: "address@email.com")
        return user
    }
}

