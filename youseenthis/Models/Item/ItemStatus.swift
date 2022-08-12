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
    
    //TODO These strings should be localized
    func stringValue() -> String {
        switch self {
        case .notSelected:
            return "Not Selected"
        case .willWatch:
            return "Want to Watch"
        case .watching:
            return "Watching"
        case .didWatch:
            return "Watched"
        case .wontWatch:
            return "Not Interested"
        }
    }
}
