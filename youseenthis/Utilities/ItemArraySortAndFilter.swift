//
//  ItemArraySortAndFilter.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/19/22.
//

import Foundation

enum ItemSortType: Int {
    case titleAscending
    case titleDescending
}

class ItemArraySortAndFilter {
        
    static func filteredItems(items: [Item], itemType: ItemType?, itemStatus: ItemStatus?) -> [Item] {
        var filteredItems = items
        if let itemType = itemType {
            filteredItems = filteredItems.filteredItemsByType(itemType: itemType)
        }
        if let itemStatus = itemStatus {
            filteredItems = filteredItems.filteredItemsByStatus(itemStatus: itemStatus)
        }
        return filteredItems
    }
    
    static func sortedItems(items: [Item], sortType: ItemSortType) -> [Item] {
        var sortedItems = items
        switch sortType {
        case .titleAscending:
            sortedItems = sortedItems.sortedItems_By_Title_Alpha_Ascending()
        case .titleDescending:
            sortedItems = sortedItems.sortedItems_By_Title_Alpha_Descending()
        }
        return sortedItems
    }
}

extension Array where Element == Item {
    mutating func sortedItems_By_Title_Alpha_Descending() -> Self {
        return self.sorted {
            $0.title < $1.title
        }
    }
    
    mutating func sortedItems_By_Title_Alpha_Ascending() -> Self {
        return self.sorted {
            $0.title > $1.title
        }
    }
    
    mutating func filteredItemsByType(itemType: ItemType) -> Self {
        return self.filter {
            $0.itemType == itemType
        }
    }
    
    mutating func filteredItemsByStatus(itemStatus: ItemStatus) -> Self {
        return self.filter {
            $0.itemStatus == itemStatus
        }
    }
    
    
}
