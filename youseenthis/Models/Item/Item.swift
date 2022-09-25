//
//  Item.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/20/22.
//

import Foundation
import SwiftUI

struct Item: Identifiable, Hashable, Codable {
    // TODO: Add var owner: String
    var id: String
    var title: String
    var itemType: ItemType
    var itemStatus: ItemStatus
    var rating: ItemRating
    var notes: String
    var tags: [String]
    
    static func defaultValue() -> Item {
        let uuidString = UUID().uuidString
        let item = Item(id: uuidString, title: "", itemType: .notSelected, itemStatus: .notSelected, rating: .notRated, notes: "", tags: [String]())
        return item
    }
    
    func rawDictionaryForLogging() -> [String: Any] {
        var itemDictionary = [String: Any]()
        itemDictionary["id"] = id
        itemDictionary["title"] = title
        itemDictionary["itemType"] = itemType.rawValue
        itemDictionary["itemStatus"] = itemStatus.rawValue
        itemDictionary["rating"] = rating
        
        return itemDictionary
    }
}

