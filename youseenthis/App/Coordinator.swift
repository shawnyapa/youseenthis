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
    @ObservedObject var viewedUserData: UserData
    @ObservedObject var itemData: ItemData
    
    private init() {
        let itemsDictionary = StorageManager.allItems()
        let itemsArray = Coordinator.itemsArray(from: itemsDictionary)
        // TODO: StorageManager.allPeople()
        let primaryUser = User.primaryUser() ?? User.sampleValue()
        let people = ExampleData.createPeople()   // TODO: Remove
        let primaryUserData = PrimaryUserData(user: primaryUser, items: itemsArray, people: people)
        // TODO: StorageManager.lastViewedUserData
        let viewedUserData = PrimaryUserData(user: primaryUser, items: itemsArray, people: people)
        self.primaryUserData = primaryUserData
        self.itemData = ItemData(items: itemsArray)
        self.viewedUserData = viewedUserData
    }
    
    func showItemsForUserId(userId: String) {
        if primaryUserData.user.id == userId {
            let itemsDictionary = StorageManager.allItems()
            let itemsArray = Coordinator.itemsArray(from: itemsDictionary)
            itemData.items = itemsArray
            viewedUserData.user = primaryUserData.user
        } else {
            let userData = primaryUserData.people.filter { person in
                person.user.id == userId
            }
            if userData.count == 1 {
                let items = userData[0].items
                itemData.items = items
                let user = userData[0].user
                viewedUserData.user = user
            }
        }
    }
    
    // TODO: Move to Peristence Layer
    func addItem(item: Item) {
        var itemsDictionary = StorageManager.allItems()
        itemsDictionary[item.id] = item
        StorageManager.saveItems(items: itemsDictionary)
        showItemsForUserId(userId: primaryUserData.user.id)
    }
    
    func editItem(item: Item) {
        var itemsDictionary = StorageManager.allItems()
        itemsDictionary.updateValue(item, forKey: item.id)
        StorageManager.saveItems(items: itemsDictionary)
        showItemsForUserId(userId: primaryUserData.user.id)
    }
    
    func removeItem(item: Item) {
        var itemsDictionary = StorageManager.allItems()
        itemsDictionary.removeValue(forKey: item.id)
        StorageManager.saveItems(items: itemsDictionary)
        showItemsForUserId(userId: primaryUserData.user.id)
    }
    
    func addUser(user: User) -> Bool {
        let success = user.savePrimaryUser(user: user)
        primaryUserData.user = user
        return success
    }
    
    func editUser(user: User) -> Bool {
        let success = user.savePrimaryUser(user: user)
        primaryUserData.user = user
        return success
    }
    
    static func itemsArray(from itemsDictionary:[String: Item]) -> [Item] {
        return itemsDictionary.map { $0.value }
    }
}
