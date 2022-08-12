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
    @ObservedObject var userData: UserData
    var itemsDictionary: [String: Item]
    var itemsArray: [Item] {
        get {
            return itemsDictionary.map { $0.value }
        }
    }
    
    private init() {
        self.itemsDictionary = StorageManager.allItems()
        let itemsArray = self.itemsDictionary.map { $0.value }
        // ***SY Implement User.getCurrentUser
        // If no user then Reroute to UserProfileView
        self.userData = UserData(user: User.sampleValue(), items: itemsArray)
    }
        
    func addItem(item: Item) {
        itemsDictionary[item.id] = item
        StorageManager.saveItems(items: itemsDictionary)
        itemsDictionary = StorageManager.allItems()
        userData.items = itemsArray
    }
    
    func editItem(item: Item) {
        itemsDictionary.updateValue(item, forKey: item.id)
        StorageManager.saveItems(items: itemsDictionary)
        itemsDictionary = StorageManager.allItems()
        userData.items = itemsArray
    }
    
    func removeItem(item: Item) {
        itemsDictionary.removeValue(forKey: item.id)
        StorageManager.saveItems(items: itemsDictionary)
        itemsDictionary = StorageManager.allItems()
        userData.items = itemsArray
    }
    
    func addUser(user: User) -> Bool {
        let success = user.saveCurrentUser()
        return success
    }
    func editUser(user: User) -> Bool {
        let success = user.saveCurrentUser()
        return success
    }
}
