//
//  FilterAndSortSettings.swift
//  youseenthis
//
//  Created by Shawn Yapa on 10/4/22.
//

import Foundation

struct FilterAndSortSettings {
    var itemSortType: ItemSortType = .titleAscending
    var filterItemType: FilterItemType = .noFilter
    var filterItemStatus: FilterItemStatus = .noFilter
    var selectedTags: [String] = [String]()
    var selectableTags: [String] = [String]()
}
