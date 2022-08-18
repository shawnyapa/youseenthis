//
//  Coordinator.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/21/22.
//

import Foundation
import SwiftUI

class Coordinator {
    static let shared = Coordinator()
    @ObservedObject var primaryUserData: PrimaryUserData
    var itemsDictionary: [String: Item]
    var itemsArray: [Item] {
        get {
            return itemsDictionary.map { $0.value }
        }
    }
    
    private init() {
        self.itemsDictionary = StorageManager.allItems()
        let itemsArray = self.itemsDictionary.map { $0.value }
        // TODO: StorageManager.allPeople()
        let user = User.currentUser() ?? User.sampleValue()
        let people = ExampleData.createPeople()   // TODO: Remove
        self.primaryUserData = PrimaryUserData(user: user, items: itemsArray, people: people)
    }
    
    // TODO: Move to Peristence Layer
    func addItem(item: Item) {
        itemsDictionary[item.id] = item
        StorageManager.saveItems(items: itemsDictionary)
        itemsDictionary = StorageManager.allItems()
        primaryUserData.items = itemsArray
    }
    
    func editItem(item: Item) {
        itemsDictionary.updateValue(item, forKey: item.id)
        StorageManager.saveItems(items: itemsDictionary)
        itemsDictionary = StorageManager.allItems()
        primaryUserData.items = itemsArray
    }
    
    func removeItem(item: Item) {
        itemsDictionary.removeValue(forKey: item.id)
        StorageManager.saveItems(items: itemsDictionary)
        itemsDictionary = StorageManager.allItems()
        primaryUserData.items = itemsArray
    }
    
    func addUser(user: User) -> Bool {
        let success = user.saveCurrentUser(user: user)
        primaryUserData.user = user
        return success
    }
    func editUser(user: User) -> Bool {
        let success = user.saveCurrentUser(user: user)
        primaryUserData.user = user
        return success
    }
}
