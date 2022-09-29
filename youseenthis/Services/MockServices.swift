//
//  MockServices.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/29/22.
//

import Foundation

/// Used for SwiftUI Preview Injection
class MockManager: LogInService, UserService, ItemService, FollowService {
    static let shared = MockManager()
        
    private init() {}

    /// MockLogInService
    func logUserIn(username: String) -> Bool { true }
    func loggedInUser() -> User? { ExampleData.createExampleUser() }
    func logoutUser() {}

    /// MockUserService
    func saveUser(user: User) {}
    func getUser(for username: String) -> User? { ExampleData.createExampleUser() }
    func returnAllUsers() -> [User] { ExampleData.createExampleUsersForLists() }
    func returnAllUser(with userNames: [String]) -> [User] { [User]() }
    func removeUserById(username: String) {}

    /// Mock ItemService
    func saveItem(item: Item) {}
    func returnAllItems() -> [Item] { [Item]() }
    func findItemById(itemId: String) -> Item? { ExampleData.createItem() }
    func removeItemById(itemId: String) {}
    func findItemsForUser(userId: String) -> [Item] { ExampleData.createItems() }

    /// Mock FollowService
    func requestToFollow(primaryUserId: String, followUserId: String) {}
    func respondToFollowRequest(followId: String, approve: Bool) {}
    func removeRequestToFollow(followId: String) {}
    func returnAllFollowRequests(for followUserId: String) -> [Follow] { ExampleData.createFollowsForLists() }
    func returnAllFollows(for primaryUserId: String) -> [Follow] { ExampleData.createFollowsForLists() }
    
}
