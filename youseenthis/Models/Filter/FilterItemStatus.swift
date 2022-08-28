//
//  FilterItemStatus.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/19/22.
//

import Foundation

enum FilterItemStatus: Int, CaseIterable, Identifiable {
    case noFilter
    case notSelected
    case willWatch
    case watching
    case didWatch
    case wontWatch
    
    var id: Int { self.rawValue }
    
    func itemStatusForFilterItemStatus() -> ItemStatus? {
        switch self {
            case .noFilter:
                return nil
            case .notSelected:
                return .notSelected
            case .willWatch:
                return .willWatch
            case .watching:
                return .watching
            case .didWatch:
                return .didWatch
            case .wontWatch:
                return .wontWatch
        }
    }
    
    func stringValue() -> String {
        switch self {
        case .noFilter:
            return ViewStrings.statusShowEverything
        case .notSelected:
            return ViewStrings.statusOnlyNotSelected
        case .willWatch:
            return ViewStrings.onlyWantToWatch
        case .watching:
            return ViewStrings.onlyWatching
        case .didWatch:
            return ViewStrings.onlyWatched
        case .wontWatch:
            return ViewStrings.onlyNotInterested
        }
    }
}
