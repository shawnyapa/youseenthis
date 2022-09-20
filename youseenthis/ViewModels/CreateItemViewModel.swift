//
//  CreateItemVM.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/18/22.
//

import Foundation

class CreateItemViewModel: ObservableObject {
            
    func addItem(title: String,
                 itemType: ItemType,
                 itemStatus: ItemStatus,
                 itemRating: ItemRating,
                 tags: [String],
                 notes: String) {
        var item = Item.defaultValue()
        item.title = title
        item.itemType = itemType
        item.itemStatus = itemStatus
        item.rating = itemRating
        item.tags = tags
        item.notes = notes
        var itemsDictionary = StorageManager.allItems()
        itemsDictionary[item.id] = item
        StorageManager.saveItems(items: itemsDictionary)
    }
}
