//
//  FilterSheet.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/31/22.
//

import SwiftUI

struct FilterAndSortView: View {
    @Binding var showFilterSheet: Bool
    @ObservedObject var filterAndSortVM: FilterAndSortViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("\(ViewStrings.sort):")
                    ItemSortTypePicker(itemSortType: $filterAndSortVM.filterAndSortSettings.itemSortType)
                }
                Divider()
                HStack {
                    Text("\(ViewStrings.filter + " " + ViewStrings.type):")
                    FilterItemTypePicker(filterItemType: $filterAndSortVM.filterAndSortSettings.filterItemType)
                }
                Divider()
                HStack {
                    Text("\(ViewStrings.filter + " " + ViewStrings.status):")
                    FilterItemStatusPicker(filterItemStatus: $filterAndSortVM.filterAndSortSettings.filterItemStatus)
                }
                Divider()
                TagsSelector(existingTags: $filterAndSortVM.filterAndSortSettings.selectableTags,
                             selectedTags: $filterAndSortVM.filterAndSortSettings.selectedTags)
                Divider()
            }
            .padding()
            .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
            .background(Color(UIColor.systemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
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
                        filterAndSortVM.clearFilter()
                    }, label: {
                        Text(ViewStrings.clear)
                    })
                }
            }
        }
    }
}

struct FilterAndSortView_Previews: PreviewProvider {
    static var previews: some View {
        FilterAndSortView(showFilterSheet: .constant(true),
                          filterAndSortVM: FilterAndSortViewModel())
    }
}
