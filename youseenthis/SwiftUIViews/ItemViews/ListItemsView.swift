//
//  ItemList.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/20/22.
//

import SwiftUI

struct ListItemsView: View {
    @ObservedObject var listItemsVM: ListItemsViewModel
    @State private var showFilterSheet: Bool = false
    @State private var showCreateItem: Bool = false
        
    var body: some View {
        NavigationStack {
            Group() {
                ZStack {
                    if listItemsVM.filteredAndSortedItems.count == 0 {
                        EmptyItemList()
                    } else {
                        List(listItemsVM.filteredAndSortedItems) { item in
                            NavigationLink {
                                if listItemsVM.canEdit {
                                    EditItemView(editItemVM: listItemsVM.createEditItemViewModel(item: item))
                                        .navigationTitle(ViewStrings.edit)
                                        .navigationBarTitleDisplayMode(.inline)
                                        .toolbarColorScheme(.dark, for: .navigationBar)
                                        .toolbarBackground(SystemColors.dankyAccentColor, for: .navigationBar)
                                        .toolbarBackground(.visible, for: .navigationBar)
                                        .toolbar(.hidden, for: .tabBar)
                                } else {
                                    ViewItemView(item: item)
                                        .navigationTitle(ViewStrings.details)
                                        .navigationBarTitleDisplayMode(.inline)
                                        .toolbarColorScheme(.dark, for: .navigationBar)
                                        .toolbarBackground(SystemColors.dankyAccentColor, for: .navigationBar)
                                        .toolbarBackground(.visible, for: .navigationBar)
                                }
                                
                            } label: {
                                ItemRow(item: item)
                            }
                        }
                        .listStyle(.plain)
                    }
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            if listItemsVM.canEdit == true {
                                Button(action: {
                                    showCreateItem.toggle()
                                }, label: {
                                    Text("+")
                                        .font(.system(.largeTitle))
                                        .frame(width: 67, height: 60)
                                        .foregroundColor(Color.white)
                                        .padding(.bottom, 7)
                                })
                                .background(SystemColors.dankyAccentColor)
                                .cornerRadius(38.5)
                                .padding()
                                .shadow(color: Color.black.opacity(0.3),
                                        radius: 3,
                                        x: 3,
                                        y: 3)
                            } else {
                                EmptyView()
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $showFilterSheet) {
                FilterAndSortView(showFilterSheet: $showFilterSheet,
                                  filterAndSortVM: listItemsVM.filterAndSortViewModel)
                    .presentationDetents([.fraction(0.75)])
            }
            .sheet(isPresented: $showCreateItem) {
                CreateItemView(showCreateItem: $showCreateItem, createItemVM: listItemsVM.createItemViewModel())
            }
            .navigationTitle(listItemsVM.listTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(SystemColors.dankyAccentColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        showFilterSheet.toggle()
                    }, label: {
                        if listItemsVM.isFilterActive {
                            Image(systemName: SystemImage.filter_on.rawValue)
                                .foregroundColor(Color.white)
                        } else {
                            Image(systemName: SystemImage.filter_off.rawValue)
                                .foregroundColor(Color.white)
                        }
                    })
                }
            }
        }
    }
}

struct ListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        let user = ExampleData.createExampleUser()
        ListItemsView(listItemsVM: ListItemsViewModel(loggedInUser: user, viewedUser: user))
    }
}
