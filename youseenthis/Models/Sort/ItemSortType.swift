//
//  ItemSortType.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/25/22.
//

import Foundation

enum ItemSortType: Int, CaseIterable, Identifiable {
    case titleAscending
    case titleDescending
    case ratingAscending
    case ratingDescending
    
    var id: Int { self.rawValue }

    func stringForPickerTextForSortType() -> String {
        switch self {
        case .titleAscending:
            return ViewStrings.alphabetical
        case .titleDescending:
            return ViewStrings.alphabetical
        case .ratingAscending:
            return ViewStrings.rating
        case .ratingDescending:
            return ViewStrings.rating
        }
    }
    
    func stringForPickerImageForSortType() -> String {
        switch self {
        case .titleAscending:
            return SystemImage.arrow_up.rawValue
        case .titleDescending:
            return SystemImage.arrow_down.rawValue
        case .ratingAscending:
            return SystemImage.arrow_up.rawValue
        case .ratingDescending:
            return SystemImage.arrow_down.rawValue
        }
    }
}
