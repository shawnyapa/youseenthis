//
//  ItemList.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/20/22.
//

import SwiftUI

struct ItemList: View {
    @Binding var primaryUser: User
    @Binding var viewedUser: User
    @Binding var people: [UserData]
    var items: [Item]
    @State private var sortSheetMode: SheetMode = .none
    @Binding var itemSortType: ItemSortType
    @State private var filterSheetMode: SheetMode = .none
    @Binding var filterItemType: FilterItemType
    @Binding var filterItemStatus: FilterItemStatus
    @Binding var selectedTags: [String]
    var canEdit: Bool {
        primaryUser.id == viewedUser.id
    }
    var listTitle: String {
        if primaryUser.id == viewedUser.id {
            return "\(ViewStrings.my) \(filterItemType.headerStringValue())"
        } else {
            return "\(viewedUser.firstName)'s \(filterItemType.headerStringValue())"
        }
    }
    var body: some View {
        NavigationView {
            Group() {
                ZStack {
                    if items.count == 0 {
                        EmptyItemList()
                    } else {
                        List(items) { item in
                            NavigationLink {
                                ItemDetail(canEdit: canEdit, mode: .view, item: item)
                            } label: {
                                ItemRow(item: item)
                            }
                        }
                    }
                    OverlaySheet(sheetMode: $sortSheetMode) {
                        SortSheet(itemSortType: $itemSortType)
                    }
                    let existingTags = ItemArraySortAndFilter.existingTags(from: items)
                    OverlaySheet(sheetMode: $filterSheetMode) {
                        FilterSheet(filterItemType: $filterItemType, filterItemStatus: $filterItemStatus, selectedTags: $selectedTags, existingTags: existingTags)
                    }
                }
            }
            .navigationTitle(listTitle)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    if canEdit == true {
                        NavigationLink {
                            let item = Item.defaultValue()
                            ItemDetail(canEdit: canEdit, mode: .create, item: item)
                        } label: {
                            Image(systemName: SystemImage.create.rawValue)
                        }
                    } else {
                        EmptyView()
                    }
                }
                ToolbarItem(placement: .navigation) {
                    NavigationLink {
                        PeopleTab(primaryUser: $primaryUser, people: $people)
                    } label: {
                        Image(systemName: SystemImage.profile.rawValue)
                    }
                }
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
                        if filterItemType == .noFilter && filterItemStatus == .noFilter {
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
        let userData = ExampleData.createUserDataWithItems()
        let people = ExampleData.createPeople()
        ItemList(primaryUser: .constant(userData.user), viewedUser: .constant(userData.user), people: .constant(people), items: userData.items, itemSortType: .constant(.titleAscending), filterItemType: .constant(.noFilter), filterItemStatus: .constant(.noFilter), selectedTags: .constant([String]()))
    }
}
