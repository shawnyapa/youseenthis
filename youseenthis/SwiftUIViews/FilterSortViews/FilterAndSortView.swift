//
//  FilterSheet.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/31/22.
//

import SwiftUI

// TODO: Refactor with ViewModel

struct FilterAndSortView: View {
    @Binding var showFilterSheet: Bool
    @Binding var itemSortType: ItemSortType
    @Binding var filterItemType: FilterItemType
    @Binding var filterItemStatus: FilterItemStatus
    @Binding var selectedTags: [String]
    @Binding var items: [Item]
    @Binding var existingTags: [String]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("\(ViewStrings.sort):")
                    ItemSortTypePicker(itemSortType: $itemSortType)
                }
                Divider()
                HStack {
                    Text("\(ViewStrings.filter + " " + ViewStrings.type):")
                    FilterItemTypePicker(filterItemType: $filterItemType)
                }
                Divider()
                HStack {
                    Text("\(ViewStrings.filter + " " + ViewStrings.status):")
                    FilterItemStatusPicker(filterItemStatus: $filterItemStatus)
                }
                Divider()
                TagsSelector(existingTags: $existingTags, selectedTags: $selectedTags)
                Divider()
            }
            .padding()
            .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
            .background(Color(UIColor.systemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            .onAppear(perform: {
                let updatedTags = calculateExistingTags(items: items)
                existingTags = updatedTags
            })
            .onChange(of: items) { newItems in
                let updatedTags = calculateExistingTags(items: newItems)
                existingTags = updatedTags
            }
            .navigationTitle(ViewStrings.filter)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(SystemColors.dankyAccentColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        showFilterSheet.toggle()
                    }, label: {
                        Text(ViewStrings.done)
                    })
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                            clearFilter()
                    }, label: {
                        Text(ViewStrings.clear)
                    })
                }
            }
        }
    }
    
    func clearFilter() {
        DispatchQueue.main.async {
            itemSortType = .titleAscending
            filterItemType = .noFilter
            filterItemStatus = .noFilter
            selectedTags = [String]()
            let tags = calculateExistingTags(items: items)
            existingTags =  tags
        }
    }
    
    func calculateExistingTags(items: [Item]) -> [String] {
        /// Apply the existing filter to the items
        let filteredItems = ItemArraySortAndFilter.filteredItems(items: items, itemType: filterItemType.itemTypeForFilterItemType(), itemStatus: filterItemStatus.itemStatusForFilterItemStatus())
        /// Calculate the existingTags from the filteredItems & Remove the currently displayed selectedTags
        let existingTags = ItemArraySortAndFilter.existingTags(from: filteredItems, selectedTags: selectedTags)
        
        return existingTags
    }
}

struct FilterAndSortView_Previews: PreviewProvider {
    static var previews: some View {
        let items = ExampleData.createItems()
        FilterAndSortView(showFilterSheet: .constant(true), itemSortType: .constant(.titleAscending), filterItemType: .constant(.movie), filterItemStatus: .constant(.willWatch), selectedTags: .constant([String]()), items: .constant(items), existingTags: .constant([String]()))
    }
}
