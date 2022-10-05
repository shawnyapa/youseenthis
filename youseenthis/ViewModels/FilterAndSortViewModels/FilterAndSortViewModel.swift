//
//  FilterAndSortViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 10/4/22.
//

import Foundation
import Combine

class FilterAndSortViewModel: ObservableObject {
    @Published var filterAndSortSettings: FilterAndSortSettings {
        didSet {
            filterSettingsSubject.send(self.filterAndSortSettings)
        }
    }
    var filterSettingsSubject = PassthroughSubject<FilterAndSortSettings, Never>()
    
    init() {
        self.filterAndSortSettings = FilterAndSortSettings()
    }
    
    func updateSelectableTags(with items:[Item]) {
        let selectableTags = calculateSelectableTags(items: items)
        filterAndSortSettings.selectableTags = selectableTags
    }
    
    func clearFilter() {
        DispatchQueue.main.async {
            let tags = self.filterAndSortSettings.selectableTags + self.filterAndSortSettings.selectedTags
            self.filterAndSortSettings = FilterAndSortSettings()
            self.filterAndSortSettings.selectableTags = tags.sorted()
        }
    }
    
    func calculateSelectableTags(items: [Item]) -> [String] {
        /// Apply the existing filter to the items -> Note: Removing Tags for items that are currently filtered works but is disabled
        /// let filteredItems = ItemArraySortAndFilter.filteredItems(items: items, itemType: filterItemType.itemTypeForFilterItemType(), itemStatus: filterItemStatus.itemStatusForFilterItemStatus())
        /// Calculate the existingTags from the filteredItems & Remove the currently displayed selectedTags
        let existingTags = ItemArraySortAndFilter.existingTags(from: items,
                                                               selectedTags: filterAndSortSettings.selectedTags)
        
        return existingTags
    }
}
