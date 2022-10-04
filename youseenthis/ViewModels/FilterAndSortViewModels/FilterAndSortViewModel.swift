//
//  FilterAndSortViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 10/4/22.
//

import Foundation

class FilterAndSortViewModel: ObservableObject {
    @Published var itemSortType: ItemSortType
    @Published var filterItemType: FilterItemType
    @Published var filterItemStatus: FilterItemStatus
    
    init(itemSortType: ItemSortType = .titleAscending,
         filterItemType: FilterItemType = .noFilter,
         filterItemStatus: FilterItemStatus = .noFilter) {
        
        self.itemSortType = itemSortType
        self.filterItemType = filterItemType
        self.filterItemStatus = filterItemStatus
    }
}
