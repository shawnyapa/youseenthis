//
//  ItemList.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/20/22.
//

import SwiftUI

struct ListItemsView: View {
    @ObservedObject var listItemsVM: ListItemsViewModel
    @State private var showCreateItem: Bool = false
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
    var massagedItems: [Item] {
        listItemsVM.massagedItems(itemSortType: itemSortType, filterItemType: filterItemType, filterItemStatus: filterItemStatus, selectedTags: selectedTags)
    }
    var body: some View {
        NavigationView {
            Group() {
                ZStack {
                    if massagedItems.count == 0 {
                        EmptyItemList()
                    } else {
                        List(massagedItems) { item in
                            NavigationLink {
                                if listItemsVM.canEdit {
                                    EditItemView(editItemVM: listItemsVM.editItemViewModel(item: item))
                                } else {
                                    ViewItemView(item: item)
                                }
                                
                            } label: {
                                ItemRow(item: item)
                            }
                        }
                    }
                    OverlaySheet(sheetMode: $filterSheetMode) {
                        FilterAndSortSheet(itemSortType: $itemSortType, filterItemType: $filterItemType, filterItemStatus: $filterItemStatus, selectedTags: $selectedTags, items: $listItemsVM.items, existingTags: $existingTags)
                    }
                }
            }
            .sheet(isPresented: $showCreateItem) {
                CreateItemView(showCreateItem: $showCreateItem, createItemVM: listItemsVM.createItemViewModel())
            }
            .navigationTitle(listTitle)
            .toolbar {
                // TODO: Move to BottomRight on top Z Layer
                ToolbarItem(placement: .navigation) {
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
                // TODO: Move to TopRight on top Z Layer
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        if filterSheetMode == .none {
                            filterSheetMode = .onequarter
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

struct ListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemsView(listItemsVM: ListItemsViewModel())
    }
}
