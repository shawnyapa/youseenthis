//
//  ViewItemVM.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/18/22.
//

import Foundation
import Combine

class ViewItemViewModel: ObservableObject {
    var item: Item
    var loggedInUser: User
    @Published var showCreateAlert = false
    var createAlertMessage: String {
        let message = item.title + ViewStrings.duplicateItemAlert
        return message
    }
    var cancellables = Set<AnyCancellable>()
    
    init(item: Item, loggedInUser: User) {
        self.item = item
        self.loggedInUser = loggedInUser
    }
    
    func createCreateItemViewModel() -> CreateItemViewModel {
        var newItem = Item.defaultValue()
        newItem.owner = loggedInUser.username
        newItem.title = item.title
        newItem.itemType = item.itemType
        newItem.itemStatus = .willWatch
        newItem.tags = item.tags
        let createVM = CreateItemViewModel(item: newItem, loggedInUser: loggedInUser)
        onUpdateItems(subject: createVM.updateItemsSubject)
        return createVM
    }
    
    func onUpdateItems(subject: PassthroughSubject<Void, Never>) {
        subject.sink { () in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.showCreateAlert.toggle()
            }
        }
        .store(in: &cancellables)
    }
}
