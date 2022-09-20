//
//  ItemList.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/20/22.
//

import SwiftUI

struct ItemList: View {
    @ObservedObject var listItemsVM: ListItemsViewModel
    @State private var showCreateItem: Bool = false
    @State private var sortSheetMode: SheetMode = .none
    @State private var filterSheetMode: SheetMode = .none
    @State private var itemSortType: ItemSortType = .titleAscending
    @State private var filterItemType: FilterItemType = .noFilter
    @State private var filterItemStatus: FilterItemStatus = .noFilter
    @State private var selectedTags: [String] = [String]()
    @State private var existingTags: [String] = [String]()

    var listTitle: String {
        if listItemsVM.showingPrimaryUserItems {
            return "\(ViewStrings.my) \(filterItemType.headerStringValue())"
        } else {
            return "\(listItemsVM.viewedUser.firstName)'s \(filterItemType.headerStringValue())"
        }
    }
    var body: some View {
        let sortedItems = ItemArraySortAndFilter.sortedItems(items: listItemsVM.items, sortType: itemSortType)
        let filteredItems = ItemArraySortAndFilter.filteredItems(items: sortedItems, itemType: filterItemType.itemTypeForFilterItemType(), itemStatus: filterItemStatus.itemStatusForFilterItemStatus())
        let matchedTaggedItems = ItemArraySortAndFilter.matchedTaggedItems(items: filteredItems, selectedTags: selectedTags)
        NavigationView {
            Group() {
                ZStack {
                    if matchedTaggedItems.count == 0 {
                        EmptyItemList()
                    } else {
                        List(matchedTaggedItems) { item in
                            NavigationLink {
                                ItemDetail(canEdit: listItemsVM.canEdit, mode: .view, item: item)
                            } label: {
                                ItemRow(item: item)
                            }
                        }
                    }
                    
                    OverlaySheet(sheetMode: $sortSheetMode) {
                        SortSheet(itemSortType: $itemSortType)
                    }
                    OverlaySheet(sheetMode: $filterSheetMode) {
                        FilterSheet(filterItemType: $filterItemType, filterItemStatus: $filterItemStatus, selectedTags: $selectedTags, items: $listItemsVM.items, existingTags: $existingTags)
                    }
                }
            }
            .sheet(isPresented: $showCreateItem) {
                CreateItemView(showCreateItem: $showCreateItem)
            }
            .navigationTitle(listTitle)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    if listItemsVM.canEdit == true {
                        Button(action: {
                            showCreateItem.toggle()
                        }, label: {
                            Image(systemName: SystemImage.create.rawValue)
                        })
                    } else {
                        EmptyView()
                    }
                }
                // TODO: Refactor for People Model Needed
//                ToolbarItem(placement: .navigation) {
//                    NavigationLink {
//                        PeopleTab(primaryUser: $primaryUser, people: $people)
//                    } label: {
//                        Image(systemName: SystemImage.profile.rawValue)
//                    }
//                }
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        if sortSheetMode == .none {
                            sortSheetMode = .threequarter
                            if filterSheetMode != .none {
                                filterSheetMode = .none
                            }
                        } else {
                            sortSheetMode = .none
                        }
                    }, label: {
                        if itemSortType == .titleAscending {
                            Image(systemName: SystemImage.sort_off.rawValue)
                        } else {
                            Image(systemName: SystemImage.sort_on.rawValue)
                        }
                    })
                }
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        if filterSheetMode == .none {
                            filterSheetMode = .onequarter
                            if sortSheetMode != .none {
                                sortSheetMode = .none
                            }
                        } else {
                            filterSheetMode = .none
                        }
                    }, label: {
                        if filterItemType == .noFilter && filterItemStatus == .noFilter && selectedTags.count == 0 {
                            Image(systemName: SystemImage.filter_off.rawValue)
                        } else {
                            Image(systemName: SystemImage.filter_on.rawValue)
                        }
                    })
                }
            }
        }
    }
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        ItemList(listItemsVM: ListItemsViewModel())
    }
}
