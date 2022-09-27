//
//  CreateItemVM.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/18/22.
//

import Foundation
import Combine

class CreateItemViewModel: ObservableObject {
    
    var modelService: (LogInService & UserService & ItemService)
    var loggedInUser: User?
    let updateItemsSubject = PassthroughSubject<Void, Never>()
    @Published var item: Item
    
    init(item: Item,
         loggedInUser: User? = nil,
         modelService: (LogInService & UserService & ItemService) = ServiceFactory.makeServices()) {
        self.item = item
        self.modelService = modelService
        if let loggedInUser = loggedInUser {
            self.loggedInUser = loggedInUser
        } else {
            self.loggedInUser = self.modelService.loggedInUser()
        }
        
    }
            
    func addItem() {
        guard item.title.isEmpty == false, loggedInUser?.username.isEmpty == false else {
            return
        }
        item.owner = loggedInUser?.username
        modelService.saveItem(item: item)
        updateItemsSubject.send()
    }
}
