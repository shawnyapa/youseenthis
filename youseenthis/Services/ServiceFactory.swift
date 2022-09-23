//
//  ServiceFactory.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/23/22.
//

import Foundation

protocol UserService {
    func saveUser(user: User)
    func getUser() -> User?
}

protocol ItemService {
    func saveItem(item: Item)
    func returnAllItems() -> [Item]
    func findItemById(itemId: String) -> Item?
    func removeItemById(itemId: String)
    func findItemsForUser(userId: String) -> [Item]
}

protocol FollowService {
    // TODO: Define FollowServic Protocol
}

class ServiceFactory {
    static func makeServices() -> (UserService & ItemService) {
        StorageManager.shared
    }
}
