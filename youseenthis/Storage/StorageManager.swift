//
//  StorageManager.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/21/22.
//

import Foundation


class StorageManager {
    
    enum Constants:String {
        case suiteName = "youseenthis"
        case itemsKey = "itemskey"
        case userKey = "userkey"
        case peopleKey = "peopleKey"
    }
    
    static func savePrimaryUser(user: User) {
        if let userData = StorageManager.encodeUser(userCodable: user) {
            if let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue) {
                defaults.set(userData, forKey: Constants.userKey.rawValue)
            }
        }
    }
    
    static func getPrimaryUser() -> User? {
        var user: User?
        let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue)
        if let userData = defaults?.object(forKey: Constants.userKey.rawValue) as? Data {
            user = decodeUser(data: userData)
        }
        return user
    }
    
    static func encodeUser(userCodable: User) -> Data? {
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
    
    static func decodeUser(data: Data) -> User? {
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

    static func allItems() -> [String:Item] {
        var items = [String:Item]()
        let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue)
        if let userDefaultItemsData = defaults?.object(forKey: Constants.itemsKey.rawValue) as? [String: Data] {
            for (key, value) in userDefaultItemsData {
                let item = StorageManager.decodeItem(data: value)
                items[key] = item
            }
        }
        return items
    }
    
    static func saveItems(items: [String: Item]) {
        var itemsData = [String:Data]()
        for (key, value) in items {
            let data = StorageManager.encodeItem(itemCodable: value)
            itemsData[key] = data
        }
        if let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue) {
            defaults.set(itemsData, forKey: Constants.itemsKey.rawValue)
        }
    }
    
    static func deleteAllItems() {
        let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue)
        defaults?.removeObject(forKey: Constants.itemsKey.rawValue)        
    }
    

    static func encodeItem(itemCodable: Item) -> Data? {
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
    
    static func decodeItem(data: Data) -> Item? {
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
    
    static func allPeopleDictionary() -> [String: UserData] {
        var peopleDictionary = [String:UserData]()
        let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue)
        if let userDefaultPeopleData = defaults?.object(forKey: Constants.peopleKey.rawValue) as? [String: Data] {
            for (key, value) in userDefaultPeopleData {
                let userData = StorageManager.decodeUserData(data: value)
                peopleDictionary[key] = userData
            }
        }
        return peopleDictionary
    }
    
    static func savePeople(peopleDictionary: [String: UserData]) {
        var peopleData = [String:Data]()
        for (key, value) in peopleDictionary {
            let data = StorageManager.encodeUserData(userData: value)
            peopleData[key] = data
        }
        if let defaults = UserDefaults.init(suiteName: Constants.suiteName.rawValue) {
            defaults.set(peopleData, forKey: Constants.peopleKey.rawValue)
        }
    }
        
    static func encodeUserData(userData: UserData) -> Data? {
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
    
    static func decodeUserData(data: Data) -> UserData? {
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
