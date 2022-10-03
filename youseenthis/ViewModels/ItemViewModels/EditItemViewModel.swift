//
//  EditItemVM.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/18/22.
//

import Foundation
import Combine
import SwiftUI

class EditItemViewModel: ObservableObject {
    
    var itemService: ItemService
    @Published var item: Item
    @Published var isUpdating = false
    let updateItemsSubject = PassthroughSubject<Void, Never>()
    
    init(itemService: ItemService = ServiceFactory.makeServices(), item: Item) {
        self.itemService = itemService
        self.item = item
    }
    
    func onChangeOfForm() {
        isUpdating = true
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
