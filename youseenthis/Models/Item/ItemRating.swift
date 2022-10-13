//
//  ItemRating.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/24/22.
//

import Foundation

enum ItemRating: Int, Hashable, Codable, CaseIterable, Identifiable, Comparable {
    case notRated
    case janky
    case suspect
    case meh
    case solid
    case danky
    
    var id: Int { self.rawValue }
    
    func stringValue() -> String {
        switch self {
        case .notRated:
            return ViewStrings.notRated
        case .janky:
            return ViewStrings.janky
        case .suspect:
            return ViewStrings.suspect
        case .meh:
            return ViewStrings.meh
        case .solid:
            return ViewStrings.solid
        case .danky:
            return ViewStrings.danky
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
    
    func imageString() -> String? {
        switch self {
        case .notRated:
            return nil
        case .janky:
            return ImageStrings.jankyRating
        case .suspect:
            return ImageStrings.suspectRating
        case .meh:
            return ImageStrings.mehRating
        case .solid:
            return ImageStrings.solidRating
        case .danky:
            return ImageStrings.dankyRating
        }
    }
    
    public static func <(lhs: ItemRating, rhs: ItemRating) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
