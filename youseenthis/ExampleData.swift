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
        let item1 = Item(id: UUID().uuidString, title: "The Mandalorian", itemType: .tvShow, itemStatus: .didWatch, rating: .danky)
        let item2 = Item(id: UUID().uuidString, title: "Ahsoka", itemType: .tvShow, itemStatus: .willWatch, rating: .notRated)
        let item3 = Item(id: UUID().uuidString, title: "Halo", itemType: .videoGame, itemStatus: .watching, rating: .notRated)
        let item4 = Item(id: UUID().uuidString, title: "Star Wars", itemType: .movie, itemStatus: .didWatch, rating: .danky)
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

    static func createPrimaryUserDataWithEmptyItemsAndEmptyPeople() -> PrimaryUserData {
        let user1 = ExampleData.createUserDataWithEmptyItems()
        let people = ExampleData.createEmptyPeople()
        let primaryUserData = PrimaryUserData(user: user1.user, items: user1.items, people: people)
        
        return primaryUserData
    }
    
    static func createExampleUser() -> User {
        let uuidString = UUID().uuidString
        let user = User(id: uuidString, username: "baxter_rundog", firstName: "Baxter", lastName: "RunDog", email: "baxter@email.com")
        return user
    }
    
    static func createEmptyItems() -> [Item] {
        
        return [Item]()
    }

    static func createEmptyPeople() -> [UserData] {
        
        return [UserData]()
    }
}
