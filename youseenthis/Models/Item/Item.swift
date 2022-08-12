//
//  Item.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/20/22.
//

import Foundation
import SwiftUI

struct Item: Identifiable, Hashable, Codable {
    
    var id: String
    var title: String
    var itemType: ItemType
    var itemStatus: ItemStatus
    
    static func defaultValue() -> Item {
        let uuidString = UUID().uuidString
        let item = Item(id: uuidString, title: "", itemType: .notSelected, itemStatus: .notSelected)
        return item
    }
}

