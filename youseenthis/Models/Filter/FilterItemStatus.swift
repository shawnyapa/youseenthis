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
    
    //TODO These strings should be localized
    func stringValue() -> String {
        switch self {
        case .noFilter:
            return "Show Everything"
        case .notSelected:
            return "Only Not Selected"
        case .willWatch:
            return "Only Want to Watch"
        case .watching:
            return "Only Watching"
        case .didWatch:
            return "Only Watched"
        case .wontWatch:
            return "Only Not Interested"
        }
    }
}
