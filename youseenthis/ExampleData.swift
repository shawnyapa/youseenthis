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
        let item1 = Item(id: UUID().uuidString, title: "The Mandalorian", itemType: .tvShow, itemStatus: .didWatch)
        let item2 = Item(id: UUID().uuidString, title: "Ahsoka", itemType: .tvShow, itemStatus: .willWatch)
        let item3 = Item(id: UUID().uuidString, title: "Halo", itemType: .videoGame, itemStatus: .watching)
        let item4 = Item(id: UUID().uuidString, title: "Star Wars", itemType: .movie, itemStatus: .didWatch)
        let items = [item1, item2, item3, item4]
        let exampleUser1 = User.sampleValue()
        let exampleUser2 = User.sampleValue()
        let exampleUser3 = User.sampleValue()
        let people = [exampleUser2, exampleUser3]
        let userData = UserData(user: exampleUser1, items: items, people: people)
        return userData
    }
    
    static func createUserWithEmptyItems() -> UserData {
        let items = [Item]()
        let exampleUser1 = User.sampleValue()
        let people = [User]()
        let userData = UserData(user: exampleUser1, items: items, people: people)
        return userData
    }
}
