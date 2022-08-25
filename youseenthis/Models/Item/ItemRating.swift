//
//  ItemRating.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/24/22.
//

import Foundation

enum ItemRating: Int, Hashable, Codable, CaseIterable, Identifiable {
    case notRated
    case janky
    case suspect
    case meh
    case solid
    case danky
    
    var id: Int { self.rawValue }
    
    // TODO: These strings should be localized
    func stringValue() -> String {
        switch self {
        case .notRated:
            return "Not Rated"
        case .janky:
            return "Janky"
        case .suspect:
            return "Suspect"
        case .meh:
            return "Meh"
        case .solid:
            return "Solid"
        case .danky:
            return "Danky"
        }
    }
    
    func intDisplay() -> String {
        switch self {
        case .notRated:
            return "-"
        case .janky:
            return "1"
        case .suspect:
            return "2"
        case .meh:
            return "3"
        case .solid:
            return "4"
        case .danky:
            return "5"
        }
    }
}
