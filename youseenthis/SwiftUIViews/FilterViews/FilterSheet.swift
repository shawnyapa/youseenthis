//
//  FilterSheet.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/31/22.
//

import SwiftUI

struct FilterSheet: View {
    @Binding var filterItemType: FilterItemType
    @Binding var filterItemStatus: FilterItemStatus
    @Binding var selectedTags: [String]
    @Binding var items: [Item]
    @Binding var existingTags: [String]
    
    var body: some View {
        VStack {
            Text(ViewStrings.filter)
            Divider()
            HStack {
                Text("\(ViewStrings.type):")
                FilterItemTypePicker(filterItemType: $filterItemType)
            }
            Divider()
            HStack {
                Text("\(ViewStrings.status):")
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
    }

    
    func calculateExistingTags(items: [Item]) -> [String] {
        /// Apply the existing filter to the items
        let filteredItems = ItemArraySortAndFilter.filteredItems(items: items, itemType: filterItemType.itemTypeForFilterItemType(), itemStatus: filterItemStatus.itemStatusForFilterItemStatus())
        /// Calculate the existingTags from the filteredItems & Remove the currently displayed selectedTags
        let existingTags = ItemArraySortAndFilter.existingTags(from: filteredItems, selectedTags: selectedTags)
        
        return existingTags
    }
}

struct FilterSheet_Previews: PreviewProvider {
    static var previews: some View {
        let userData = ExampleData.createUserDataWithItems()
        FilterSheet(filterItemType: .constant(.movie), filterItemStatus: .constant(.willWatch), selectedTags: .constant([String]()), items: .constant(userData.items), existingTags: .constant([String]()))
    }
}
