//
//  ServiceFactory.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/23/22.
//

import Foundation

protocol LogInService {
    func logUserIn(username: String)
    func loggedInUser() -> User?
    func logoutUser()
}
protocol UserService {
    func saveUser(user: User)
    func getUser(for username: String) -> User?
    func returnAllUsers() -> [User]
    func returnAllUser(with userNames: [String]) -> [User]
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
    static func makeServices() -> (LogInService & UserService & ItemService) {
        StorageManager.shared
    }
}
