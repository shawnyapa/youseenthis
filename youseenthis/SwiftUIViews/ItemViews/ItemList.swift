//
//  ItemList.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/20/22.
//

import SwiftUI

struct ItemList: View {
    var items: [Item]
    @State private var filterSheetMode: SheetMode = .none
    @Binding var filterItemType: FilterItemType
    @Binding var filterItemStatus: FilterItemStatus
    var canEdit: Bool = true
    var listTitle: String = "Movies/TV Shows"
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
                    FilterSheet(sheetMode: $filterSheetMode) {
                        VStack {
                            Text("Filter")
                            Divider()
                            HStack {
                                Text("Type:")
                                FilterItemTypePicker(filterItemType: $filterItemType)
                            }
                            Divider()
                            HStack {
                                Text("Status:")
                                FilterItemStatusPicker(filterItemStatus: $filterItemStatus)
                            }
                            Divider()
                        }
                        .padding()
                        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
                        .background(Color(UIColor.systemGroupedBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                    }
                }
            }
            .navigationTitle(listTitle)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink {
                        let item = Item.defaultValue()
                        ItemDetail(canEdit: canEdit, mode: .create, item: item)
                    } label: {
                        Image(systemName: SystemImage.create.rawValue)
                    }
                }
                ToolbarItem(placement: .navigation) {
                    NavigationLink {
                        // ***SY Test Data - Refactor
                        let peopleList = [User.sampleValue(),User.sampleValue()]
                        let user = User.sampleValue()
                        PeopleTab(owner: user, peopleList: peopleList)
                    } label: {
                        Image(systemName: SystemImage.profile.rawValue)
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        // Show Sort on SheetMode
                    }, label: {
                        Image(systemName: SystemImage.sort.rawValue)
                    })
                }
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        if filterSheetMode == .none {
                            filterSheetMode = .threequarter
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
        ItemList(items: userData.items, filterItemType: .constant(.noFilter), filterItemStatus: .constant(.noFilter))
    }
}
