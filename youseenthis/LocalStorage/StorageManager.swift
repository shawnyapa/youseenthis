//
//  StorageManager.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/21/22.
//

import Foundation

class StorageManager: LogInService, UserService, ItemService, FollowService {
    static let shared = StorageManager()
    
    enum Constants:String {
        case suiteName = "youseenthis"
        case itemsKey = "itemskey"
        case loggedInKey = "loggedinkey"
        case usersKey = "userskey"
        case followsKey = "followsKey"
    }
    
    private init() {}
    
    /// LogInService Implementation
    func logUserIn(username: String) {
        if let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue) {
            defaults.set(username, forKey: Constants.loggedInKey.rawValue)
        }
        /// // TODO: Remove Temporary for ItemOwner Refactor
        //  updateAllItemsWithOwner(owner: username)
    }
    func loggedInUser() -> User? {
        var user: User?
        let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue)
        if let username = defaults?.object(forKey: Constants.loggedInKey.rawValue) as? String {
            user = getUser(for: username)
        }
        return user
    }
    func logoutUser() {
        if let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue) {
            defaults.removeObject(forKey: Constants.loggedInKey.rawValue)
        }
    }
    
    /// UserService Implementation
    func saveUser(user: User) {
        var usersDictionary = allUsersDictionary()
        usersDictionary.updateValue(user, forKey: user.id)
        saveUsers(users: usersDictionary)
    }
    
    func getUser(for username: String) -> User? {
        let users = returnAllUsers().filter { $0.username == username }
        guard users.count == 1 else {
            return nil
        }
        return users.first
    }
    
    func returnAllUsers() -> [User] {
        allUsersDictionary().map { $0.value }
    }
    
    func returnAllUser(with userNames: [String]) -> [User] {
        returnAllUsers().filter { userNames.contains( $0.username) }
    }
    
    private func allUsersDictionary() -> [String:User] {
        var users = [String:User]()
        let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue)
        if let userDefaultUsersData = defaults?.object(forKey: Constants.usersKey.rawValue) as? [String: Data] {
            for (key, value) in userDefaultUsersData {
                let user = decodeUser(data: value)
                users[key] = user
            }
        }
        return users
    }
    
    private func saveUsers(users: [String: User]) {
        var usersData = [String:Data]()
        for (key, value) in users {
            let data = encodeUser(userCodable: value)
            usersData[key] = data
        }
        if let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue) {
            defaults.set(usersData, forKey: Constants.usersKey.rawValue)
        }
    }
    
    private func encodeUser(userCodable: User) -> Data? {
        let archiver = NSKeyedArchiver(requiringSecureCoding: false)
        do {
            try archiver.encodeEncodable(userCodable, forKey: NSKeyedArchiveRootObjectKey)
        }
        catch {
            fatalError(error.localizedDescription)
        }
        archiver.finishEncoding()
        return archiver.encodedData
    }
    
    private func decodeUser(data: Data) -> User? {
        do {
            let unarchiver = try NSKeyedUnarchiver(forReadingFrom: data)
            let user = unarchiver.decodeDecodable(User.self, forKey:NSKeyedArchiveRootObjectKey)
            unarchiver.finishDecoding()
            return user
        } catch  {
            print("DecodeUser Failed")
            return nil
        }
    }

    /// ItemsService Implementation
    func saveItem(item: Item) {
        var itemsDictionary = allItemsDictionary()
        itemsDictionary.updateValue(item, forKey: item.id)
        saveItems(items: itemsDictionary)
    }
    
    func returnAllItems() -> [Item] {
        let allItems = allItemsDictionary()
        return allItems.map { $0.value }
    }
    
    func findItemById(itemId: String) -> Item? {
        let itemsDictionary = allItemsDictionary()
        guard let item = itemsDictionary[itemId] else {
            return nil
        }
        return item
    }
    
    func removeItemById(itemId: String) {
        var itemsDictionary = allItemsDictionary()
        itemsDictionary.removeValue(forKey: itemId)
        saveItems(items: itemsDictionary)
    }
    
    func findItemsForUser(userId: String) -> [Item] {
        returnAllItems().filter { $0.owner == userId}
    }
    
    private func allItemsDictionary() -> [String:Item] {
        var items = [String:Item]()
        let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue)
        if let userDefaultItemsData = defaults?.object(forKey: Constants.itemsKey.rawValue) as? [String: Data] {
            for (key, value) in userDefaultItemsData {
                let item = decodeItem(data: value)
                items[key] = item
            }
        }
        return items
    }
    
    private func saveItems(items: [String: Item]) {
        var itemsData = [String:Data]()
        for (key, value) in items {
            let data = encodeItem(itemCodable: value)
            itemsData[key] = data
        }
        if let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue) {
            defaults.set(itemsData, forKey: Constants.itemsKey.rawValue)
        }
    }
    
    private func deleteAllItems() {
        let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue)
        defaults?.removeObject(forKey: Constants.itemsKey.rawValue)        
    }
    
    private func updateAllItemsWithOwner(owner: String) {
        let items = returnAllItems()
        var itemsDictionary = [String: Item]()
        for var item in items {
            item.owner = owner
            itemsDictionary.updateValue(item, forKey: item.id)
        }
        saveItems(items: itemsDictionary)
    }
    

    private func encodeItem(itemCodable: Item) -> Data? {
        let archiver = NSKeyedArchiver(requiringSecureCoding: false)
        do {
            try archiver.encodeEncodable(itemCodable, forKey: NSKeyedArchiveRootObjectKey)
        }
        catch {
            fatalError(error.localizedDescription)
        }
        archiver.finishEncoding()
        return archiver.encodedData
    }
    
    private func decodeItem(data: Data) -> Item? {
        do {
            let unarchiver = try NSKeyedUnarchiver(forReadingFrom: data)
            let item = unarchiver.decodeDecodable(Item.self, forKey:NSKeyedArchiveRootObjectKey)
            unarchiver.finishDecoding()
            return item
        } catch  {
            print("DecodeItem Failed")
            return nil
        }
    }
    
    /// FollowService Implementation
    func requestToFollow(primaryUserId: String, followUserId: String) {
        let follow = Follow(id: UUID().uuidString, primaryUsername: primaryUserId, followUsername: followUserId, isApproved: false)
        saveFollow(follow: follow)
    }
    
    func respondToFollowRequest(followId: String, approve: Bool) {
        if approve == false {
            removeFollowById(followId: followId)
        } else if approve == true, var follow = findFollowById(followId: followId) {
            follow.isApproved = true
            saveFollow(follow: follow)
        }
    }
    
    func removeRequestToFollow(followId: String) {
        removeFollowById(followId: followId)
    }
    
    func returnAllFollowRequests(for primaryUserId: String) -> [Follow] {
        let allFollows = returnAllFollows()
        let allFollowRequests = allFollows.filter { $0.primaryUsername == primaryUserId && $0.isApproved == false }
        
        return allFollowRequests
    }
    
    func returnAllFollowAppovals(for primaryUserId: String) -> [Follow] {
        let allFollows = returnAllFollows()
        let allFollowApprovals = allFollows.filter { $0.primaryUsername == primaryUserId && $0.isApproved == true }
        
        return allFollowApprovals
    }
    
    private func saveFollow(follow: Follow) {
        var followsDictionary = allFollowsDictionary()
        followsDictionary.updateValue(follow, forKey: follow.id)
        saveFollows(follows: followsDictionary)
    }
    
    private func findFollowById(followId: String) -> Follow? {
        let followsDictionary = allFollowsDictionary()
        guard let follow = followsDictionary[followId] else {
            return nil
        }
        return follow
    }
    
    private func removeFollowById(followId: String) {
        var followsDictionary = allFollowsDictionary()
        followsDictionary.removeValue(forKey: followId)
        saveFollows(follows: followsDictionary)
    }
    
    private func returnAllFollows() -> [Follow] {
        allFollowsDictionary().map { $0.value }
    }
    
    private func allFollowsDictionary() -> [String:Follow] {
        var follows = [String:Follow]()
        let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue)
        if let userDefaultFollowsData = defaults?.object(forKey: Constants.followsKey.rawValue) as? [String: Data] {
            for (key, value) in userDefaultFollowsData {
                let follow = decodeFollow(data: value)
                follows[key] = follow
            }
        }
        return follows
    }

    private func saveFollows(follows: [String: Follow]) {
        var followsData = [String:Data]()
        for (key, value) in follows {
            let data = encodeFollow(followCodable: value)
            followsData[key] = data
        }
        if let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue) {
            defaults.set(followsData, forKey: Constants.followsKey.rawValue)
        }
    }
    
    private func encodeFollow(followCodable: Follow) -> Data? {
        let archiver = NSKeyedArchiver(requiringSecureCoding: false)
        do {
            try archiver.encodeEncodable(followCodable, forKey: NSKeyedArchiveRootObjectKey)
        }
        catch {
            fatalError(error.localizedDescription)
        }
        archiver.finishEncoding()
        return archiver.encodedData
    }
    
    private func decodeFollow(data: Data) -> Follow? {
        do {
            let unarchiver = try NSKeyedUnarchiver(forReadingFrom: data)
            let follow = unarchiver.decodeDecodable(Follow.self, forKey:NSKeyedArchiveRootObjectKey)
            unarchiver.finishDecoding()
            return follow
        } catch  {
            print("DecodeFollow Failed")
            return nil
        }
    }
}
