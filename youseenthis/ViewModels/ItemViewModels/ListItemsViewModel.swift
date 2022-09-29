//
//  ListItemsVM.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/18/22.
//

import Foundation
import Combine

class ListItemsViewModel: ObservableObject {
    
    var modelService: (LogInService & UserService & ItemService)
    var loggedInUser: User
    @Published var viewedUser: User
    @Published var items: [Item] = [Item]()
    var cancellables = Set<AnyCancellable>()
    
    var canEdit: Bool {
        loggedInUser.id == viewedUser.id
    }
    
    var showingLoggedInUserItems: Bool {
        loggedInUser.id == viewedUser.id
    }
    
    init(modelService: (LogInService & UserService & ItemService) = ServiceFactory.makeServices(),
         loggedInUser: User) {
        self.modelService = modelService
        self.loggedInUser = loggedInUser
        self.viewedUser = loggedInUser
        refreshItems()
    }
    
    func showUser(viewedUser:User) {
        self.viewedUser = viewedUser
        refreshItems()
    }
    
    func refreshItems() {
        items = modelService.findItemsForUser(userId: viewedUser.username)
    }
    
    func onUpdateItems(subject: PassthroughSubject<Void, Never>) {
        subject.sink { () in
            self.refreshItems()
        }
        .store(in: &cancellables)
    }
    
    func createItemViewModel() -> CreateItemViewModel {
        let createVM = CreateItemViewModel(item: Item.defaultValue(), loggedInUser: loggedInUser)
        onUpdateItems(subject: createVM.updateItemsSubject)
        return createVM
    }
    
    func editItemViewModel(item: Item) -> EditItemViewModel {
        let editVM = EditItemViewModel(item: item)
        onUpdateItems(subject: editVM.updateItemsSubject)
        return editVM
    }
    
    func massagedItems(itemSortType: ItemSortType,
                       filterItemType: FilterItemType,
                       filterItemStatus: FilterItemStatus,
                       selectedTags: [String]) -> [Item] {
        let sortedItems = ItemArraySortAndFilter.sortedItems(items: items, sortType: itemSortType)
        let filteredItems = ItemArraySortAndFilter.filteredItems(items: sortedItems, itemType: filterItemType.itemTypeForFilterItemType(), itemStatus: filterItemStatus.itemStatusForFilterItemStatus())
        let matchedTaggedItems = ItemArraySortAndFilter.matchedTaggedItems(items: filteredItems, selectedTags: selectedTags)
        
        return matchedTaggedItems
    }
    
}
