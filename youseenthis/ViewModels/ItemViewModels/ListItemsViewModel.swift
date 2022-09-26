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
    @Published var primaryUser: User
    @Published var viewedUser: User
    @Published var items: [Item] = [Item]()
    var cancellables = Set<AnyCancellable>()
    
    var canEdit: Bool {
        primaryUser.id == viewedUser.id
    }
    
    var showingPrimaryUserItems: Bool {
        primaryUser.id == viewedUser.id
    }
    
    init(modelService: (LogInService & UserService & ItemService) = ServiceFactory.makeServices()) {
        self.modelService = modelService
        let user = modelService.loggedInUser() ?? User.newBlankUser()
        self.primaryUser = user
        self.viewedUser = user
        refreshItems()
    }
    
    func showUser(viewedUser:User) {
        self.viewedUser = viewedUser
        refreshItems()
    }
    
    func refreshItems() {
        items = modelService.returnAllItems()
    }
    
    func onUpdateItems(subject: PassthroughSubject<Void, Never>) {
        subject.sink { () in
            self.refreshItems()
        }
        .store(in: &cancellables)
    }
    
    func createItemViewModel() -> CreateItemViewModel {
        let createVM = CreateItemViewModel(item: Item.defaultValue())
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
