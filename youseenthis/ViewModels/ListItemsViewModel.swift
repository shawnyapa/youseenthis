//
//  ListItemsVM.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/18/22.
//

import Foundation

class ListItemsViewModel: ObservableObject {
    
    @Published var primaryUser: User
    @Published var viewedUser: User
    @Published var items: [Item] = [Item]()
    
    var canEdit: Bool {
        primaryUser.id == viewedUser.id
    }
    
    var showingPrimaryUserItems: Bool {
        primaryUser.id == viewedUser.id
    }
    
    init() {
        let user = StorageManager.getPrimaryUser() ?? User.newBlankUser()
        self.primaryUser = user
        self.viewedUser = user
        refreshItems()
    }
    
    func showUser(viewedUser:User) {
        self.viewedUser = viewedUser
        refreshItems()
    }
    
    func refreshItems() {
        let itemsDictionary = StorageManager.allItems()
        let itemsArray = itemsDictionary.map { $0.value }
        items = itemsArray
    }
    
}
