//
//  EditItemVM.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/18/22.
//

import Foundation
import Combine

class EditItemViewModel: ObservableObject {
    
    var modelService: (UserService & ItemService)
    let updateItemsSubject = PassthroughSubject<Void, Never>()
    @Published var item: Item
    
    init(item: Item, modelService: (UserService & ItemService) = ServiceFactory.makeServices()) {
        self.item = item
        self.modelService = modelService
    }
    
    func editItem() {
        modelService.saveItem(item: item)
        updateItemsSubject.send()
    }
    
    func removeItem() {
        modelService.removeItemById(itemId: item.id)
        updateItemsSubject.send()
    }
}
