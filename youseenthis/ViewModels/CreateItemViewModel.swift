//
//  CreateItemVM.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/18/22.
//

import Foundation
import Combine

class CreateItemViewModel: ObservableObject {
    
    let updateItemsSubject = PassthroughSubject<Void, Never>()
    @Published var item: Item
    
    init(item: Item) {
        self.item = item
    }
            
    func addItem() {
        guard item.title.isEmpty == false else {
            return
        }
        var itemsDictionary = StorageManager.allItems()
        itemsDictionary[item.id] = item
        StorageManager.saveItems(items: itemsDictionary)
        updateItemsSubject.send()
    }
}
