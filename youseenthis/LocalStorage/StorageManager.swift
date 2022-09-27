//
//  StorageManager.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/21/22.
//

import Foundation

class StorageManager: LogInService, UserService, ItemService {
    static let shared = StorageManager()
    
    enum Constants:String {
        case suiteName = "youseenthis"
        case itemsKey = "itemskey"
        case loggedInKey = "loggedinkey"
        case usersKey = "userskey"
        case peopleKey = "peopleKey"
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
        var usersDictionary = allUsers()
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
        allUsers().map { $0.value }
    }
    
    func returnAllUser(with userNames: [String]) -> [User] {
        returnAllUsers().filter { userNames.contains( $0.username) }
    }
    
    private func allUsers() -> [String:User] {
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
        var itemsDictionary = allItems()
        itemsDictionary.updateValue(item, forKey: item.id)
        saveItems(items: itemsDictionary)
    }
    func returnAllItems() -> [Item] {
        let allItems = allItems()
        return allItems.map { $0.value }
    }
    func findItemById(itemId: String) -> Item? {
        let itemsDictionary = allItems()
        guard let item = itemsDictionary[itemId] else {
            return nil
        }
        return item
    }
    func removeItemById(itemId: String) {
        var itemsDictionary = allItems()
        itemsDictionary.removeValue(forKey: itemId)
        saveItems(items: itemsDictionary)
    }
    func findItemsForUser(userId: String) -> [Item] {
        returnAllItems().filter { $0.owner == userId}
    }
    
    private func allItems() -> [String:Item] {
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
        var items = returnAllItems()
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
    
    // TODO: Implement FollowService & Deprecate People functions
//    func requestToFollow(primaryUserId: String, followUserId: String)
//    func removeRequestToFollow(primaryUserId: String, followUserId: String)
//    func respondToFollowRequest(primaryUserId: String, followUserId: String, approve: Bool)
//    func returnAllFollowRequests(for primaryUserId: String) -> [Follow]
//    func returnAllFollowAppovals(for primaryUserId: String) -> [Follow]
    
    func allPeopleDictionary() -> [String: UserData] {
        var peopleDictionary = [String:UserData]()
        let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue)
        if let userDefaultPeopleData = defaults?.object(forKey: Constants.peopleKey.rawValue) as? [String: Data] {
            for (key, value) in userDefaultPeopleData {
                let userData = decodeUserData(data: value)
                peopleDictionary[key] = userData
            }
        }
        return peopleDictionary
    }
    
    func savePeople(peopleDictionary: [String: UserData]) {
        var peopleData = [String:Data]()
        for (key, value) in peopleDictionary {
            let data = encodeUserData(userData: value)
            peopleData[key] = data
        }
        if let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue) {
            defaults.set(peopleData, forKey: Constants.peopleKey.rawValue)
        }
    }
        
    func encodeUserData(userData: UserData) -> Data? {
        let archiver = NSKeyedArchiver(requiringSecureCoding: false)
        do {
            try archiver.encodeEncodable(userData, forKey: NSKeyedArchiveRootObjectKey)
        }
        catch {
            fatalError(error.localizedDescription)
        }
        archiver.finishEncoding()
        return archiver.encodedData
    }
    
    func decodeUserData(data: Data) -> UserData? {
        do {
            let unarchiver = try NSKeyedUnarchiver(forReadingFrom: data)
            let userData = unarchiver.decodeDecodable(UserData.self, forKey:NSKeyedArchiveRootObjectKey)
            unarchiver.finishDecoding()
            return userData
        } catch  {
            print("DecodeUserData Failed")
            return nil
        }
    }
    
}
