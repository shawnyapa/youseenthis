//
//  ExampleData.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/20/22.
//

import Foundation

// Only used for SwiftUI_Previews
struct ExampleData {
    
    static func createUserDataWithItems() -> UserData {
        let item1 = Item(id: UUID().uuidString, title: "The Mandalorian", itemType: .tvShow, itemStatus: .didWatch, rating: .danky, notes: "", tags:[String]())
        let item2 = Item(id: UUID().uuidString, title: "Ahsoka", itemType: .tvShow, itemStatus: .willWatch, rating: .janky, notes: "", tags:[String]())
        let item3 = Item(id: UUID().uuidString, title: "Halo", itemType: .videoGame, itemStatus: .watching, rating: .notRated, notes: "", tags:[String]())
        let item4 = Item(id: UUID().uuidString, title: "Star Wars", itemType: .movie, itemStatus: .didWatch, rating: .danky, notes: "", tags:["StarWars, SciFi"])
        let items = [item1, item2, item3, item4]
        let exampleUser1 = ExampleData.createExampleUser()
        let userData = UserData(user: exampleUser1, items: items, version: nil)
        return userData
    }
    
    static func createUserDataWithEmptyItems() -> UserData {
        let items = ExampleData.createEmptyItems()
        let exampleUser1 = ExampleData.createExampleUser()
        let userData = UserData(user: exampleUser1, items: items, version: nil)
        return userData
    }
    
    static func createPeople() -> [UserData] {
        let user1 = ExampleData.createUserDataWithItems()
        
        return [user1]
    }
    
    static func createItem() -> Item {
        Item(id: UUID().uuidString, title: "Star Wars", itemType: .movie, itemStatus: .didWatch, rating: .danky, notes: "", tags:["StarWars, SciFi"])
    }
    
    static func createItems() -> [Item] {
        let item1 = Item(id: UUID().uuidString, title: "The Mandalorian", itemType: .tvShow, itemStatus: .didWatch, rating: .danky, notes: "", tags:[String]())
        let item2 = Item(id: UUID().uuidString, title: "Ahsoka", itemType: .tvShow, itemStatus: .willWatch, rating: .janky, notes: "", tags:[String]())
        let item3 = Item(id: UUID().uuidString, title: "Halo", itemType: .videoGame, itemStatus: .watching, rating: .notRated, notes: "", tags:[String]())
        let item4 = Item(id: UUID().uuidString, title: "Star Wars", itemType: .movie, itemStatus: .didWatch, rating: .danky, notes: "", tags:["StarWars, SciFi"])
        
        return [item1, item2, item3, item4]
    }
    
    static func createExampleUser() -> User {
        let uuidString = UUID().uuidString
        let user = User(id: uuidString, username: "baxter_rundog", firstName: "Baxter", lastName: "RunDog", email: "baxter@email.com", phoneNumber: "", aboutMe: "I'm a big fan of multiple genres, including Detective, Drama, and Rom-Coms.")
        return user
    }
    
    static func createExampleUsersForLists() -> [User] {

        let user1 = User(id: UUID().uuidString, username: "baxter_rundog", firstName: "Baxter", lastName: "RunDog", email: "baxter@email.com", phoneNumber: "", aboutMe: "")
        let user2 = User(id: UUID().uuidString, username: "testuser_2", firstName: "Test", lastName: "User2", email: "testuser_2@email.com", phoneNumber: "", aboutMe: "")
        let user3 = User(id: UUID().uuidString, username: "testuser_3", firstName: "Chess", lastName: "Checkers", email: "testuser_3@email.com", phoneNumber: "", aboutMe: "")
        
        return [user1, user2, user3]
    }
    
    static func createEmptyItems() -> [Item] {
        
        return [Item]()
    }
    
    static func createFollowsForLists() -> [Follow] {
        let users = ExampleData.createExampleUsersForLists()
        let follow1 = Follow(id: UUID().uuidString, primaryUsername: users[0].username, followUsername: users[1].username, isApproved: true)
        let follow2 = Follow(id: UUID().uuidString, primaryUsername: users[1].username, followUsername: users[0].username, isApproved: true)
        let follow3 = Follow(id: UUID().uuidString, primaryUsername: users[1].username, followUsername: users[2].username, isApproved: false)
        let follow4 = Follow(id: UUID().uuidString, primaryUsername: users[2].username, followUsername: users[1].username, isApproved: false)
        let follows = [follow1, follow2, follow3, follow4]
        
        return follows
    }

    static func createEmptyFollow() -> [Follow] {
        
        return [Follow]()
    }
    
    static func createRandomTags() -> [String] {
        let tags = ["Drama",
                    "Comedy",
                    "SciFi",
                    "Family",
                    "Kids",
                    "Action",
                    "Horror",
                    "Independent",
                    "Romance",
                    "Live",
                    "Sports",
                    "Reality",
                    "Documentary"
        ]
        
        return tags
    }
}
