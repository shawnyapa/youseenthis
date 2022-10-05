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
    @Published var filteredAndSortedItems: [Item] = [Item]()
    var filterAndSortSettings = FilterAndSortSettings()
    var filterAndSortViewModel = FilterAndSortViewModel()
    var cancellables = Set<AnyCancellable>()
    
    var canEdit: Bool {
        loggedInUser.id == viewedUser.id
    }

    var listTitle: String {
        let filterItemType = filterAndSortViewModel.filterAndSortSettings.filterItemType
        if loggedInUser.id == viewedUser.id {
            return "\(ViewStrings.my) \(filterItemType.headerStringValue())"
        } else {
            return "\(viewedUser.firstName)'s \(filterItemType.headerStringValue())"
        }
    }
    
    var isFilterActive: Bool {
        if filterAndSortSettings.filterItemType == .noFilter,
            filterAndSortSettings.filterItemStatus == .noFilter,
            filterAndSortSettings.selectedTags.count == 0 {
            return false
        } else {
            return true
        }
    }
    
    init(modelService: (LogInService & UserService & ItemService) = ServiceFactory.makeServices(),
         loggedInUser: User,
         viewedUser: User) {
        self.modelService = modelService
        self.loggedInUser = loggedInUser
        self.viewedUser = viewedUser
        self.filterAndSortViewModel = createFilterAndSortViewModel()
        refreshItems()
    }
    
    func showUser(viewedUser:User) {
        DispatchQueue.main.async {
            self.viewedUser = viewedUser
        }
        refreshItems()
    }
    
    func refreshItems() {
        let items = modelService.findItemsForUser(userId: viewedUser.username)
        DispatchQueue.main.async {
            self.items = items
            self.filterAndSortViewModel.updateSelectableTags(with: items)
            self.filteredAndSortedItems = self.filterAndSortItems(filterAndSortSettings: self.filterAndSortSettings)
        }
    }
    
    func onUpdateFilterSettings(subject: PassthroughSubject<FilterAndSortSettings, Never>) {
        subject.sink { filterSettings in
            DispatchQueue.main.async {
                self.filterAndSortSettings = filterSettings
                self.filteredAndSortedItems = self.filterAndSortItems(filterAndSortSettings: filterSettings)
            }
        }
        .store(in: &cancellables)
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
    
    func createEditItemViewModel(item: Item) -> EditItemViewModel {
        let editVM = EditItemViewModel(item: item)
        onUpdateItems(subject: editVM.updateItemsSubject)
        return editVM
    }
    
    func createFilterAndSortViewModel() -> FilterAndSortViewModel {
        let filterAndSortVM = FilterAndSortViewModel()
        onUpdateFilterSettings(subject: filterAndSortVM.filterSettingsSubject)
        return filterAndSortVM
    }
    
    func filterAndSortItems(filterAndSortSettings: FilterAndSortSettings) -> [Item] {
        let sortedItems = ItemArraySortAndFilter.sortedItems(items: items, sortType: filterAndSortSettings.itemSortType)
        let filteredItems = ItemArraySortAndFilter.filteredItems(items: sortedItems,
                                                                 itemType: filterAndSortSettings.filterItemType.itemTypeForFilterItemType(),
                                                                 itemStatus: filterAndSortSettings.filterItemStatus.itemStatusForFilterItemStatus())
        let matchedTaggedItems = ItemArraySortAndFilter.matchedTaggedItems(items: filteredItems, selectedTags: filterAndSortSettings.selectedTags)
        
        return matchedTaggedItems
    }
    
}
