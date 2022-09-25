//
//  ServiceFactory.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/23/22.
//

import Foundation

// TODO: UserService should be changed to an array, with a primaryUser marker
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
    func requestToFollow(primaryUserId: String, followUserId: String)
    func removeRequestToFollow(primaryUserId: String, followUserId: String)
    func respondToFollowRequest(primaryUserId: String, followUserId: String, approve: Bool)
    func returnAllFollowRequests(for primaryUserId: String) -> [Follow]
    func returnAllFollowAppovals(for primaryUserId: String) -> [Follow]
}

class ServiceFactory {
    static func makeServices() -> (UserService & ItemService) {
        StorageManager.shared
    }
}
