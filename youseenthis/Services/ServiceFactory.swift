//
//  ServiceFactory.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/23/22.
//

import Foundation

protocol LogInService {
    func logUserIn(username: String) -> Bool
    func loggedInUser() -> User?
    func logoutUser()
}
protocol UserService {
    func saveUser(user: User)
    func getUser(for username: String) -> User?
    func returnAllUsers() -> [User]
    func returnAllUser(with userNames: [String]) -> [User]
    func removeUserById(username: String)
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
    func respondToFollowRequest(followId: String, approve: Bool)
    func removeRequestToFollow(followId: String)
    func returnAllFollowRequests(for followUserId: String) -> [Follow]
    func returnAllFollows(for primaryUserId: String) -> [Follow]
}

class ServiceFactory {
    static func makeServices() -> (LogInService & UserService & ItemService & FollowService) {
        StorageManager.shared
    }
}
