//
//  StorageManager.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/21/22.
//

import Foundation

class StorageManager: UserService, ItemService {
    static let shared = StorageManager()
    
    enum Constants:String {
        case suiteName = "youseenthis"
        case itemsKey = "itemskey"
        case userKey = "userkey"
        case peopleKey = "peopleKey"
    }
    
    private init() {}
    
    /// UserService Implementation
    func saveUser(user: User) {
        if let user = encodeUser(userCodable: user) {
            if let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue) {
                defaults.set(user, forKey: Constants.userKey.rawValue)
            }
        }
    }
    
    func getUser() -> User? {
        var user: User?
        let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue)
        if let data = defaults?.object(forKey: Constants.userKey.rawValue) as? Data {
            user = decodeUser(data: data)
        }
        return user
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
        // TODO: Implement
        return [Item]()
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
