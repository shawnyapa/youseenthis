//
//  EditItemVM.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/18/22.
//

import Foundation
import Combine

class EditItemViewModel: ObservableObject {
    
    let updateItemsSubject = PassthroughSubject<Void, Never>()
    @Published var item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    func editItem() {
        var itemsDictionary = StorageManager.allItems()
        itemsDictionary.updateValue(item, forKey: item.id)
        StorageManager.saveItems(items: itemsDictionary)
        updateItemsSubject.send()
    }
    
    func removeItem() {
        var itemsDictionary = StorageManager.allItems()
        itemsDictionary.removeValue(forKey: item.id)
        StorageManager.saveItems(items: itemsDictionary)
        updateItemsSubject.send()
    }
}
