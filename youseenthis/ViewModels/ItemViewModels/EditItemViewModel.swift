//
//  EditItemVM.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/18/22.
//

import Foundation
import Combine

class EditItemViewModel: ObservableObject {
    
    var itemService: ItemService
    @Published var item: Item
    let updateItemsSubject = PassthroughSubject<Void, Never>()
    
    init(itemService: ItemService = ServiceFactory.makeServices(), item: Item) {
        self.itemService = itemService
        self.item = item
    }
    
    func editItem() {
        itemService.saveItem(item: item)
        updateItemsSubject.send()
    }
    
    func removeItem() {
        itemService.removeItemById(itemId: item.id)
        updateItemsSubject.send()
    }
}
