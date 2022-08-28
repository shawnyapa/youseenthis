//
//  ItemStatus.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/13/22.
//

import Foundation

enum ItemStatus: Int, Hashable, Codable, CaseIterable, Identifiable {
    case notSelected
    case willWatch
    case watching
    case didWatch
    case wontWatch
    
    var id: Int { self.rawValue }
    
    func stringValue() -> String {
        switch self {
        case .notSelected:
            return ViewStrings.statusNotSelected
        case .willWatch:
            return ViewStrings.willWatch
        case .watching:
            return ViewStrings.watching
        case .didWatch:
            return ViewStrings.didWatch
        case .wontWatch:
            return ViewStrings.wontWatch
        }
    }
}
