//
//  FilterItemType.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/17/22.
//

import Foundation

enum FilterItemType: Int, CaseIterable, Identifiable {
    case noFilter
    case notSelected
    case movie
    case tvShow
    case videoGame
    
    var id: Int { self.rawValue }
    
    func itemTypeForFilterItemType() -> ItemType? {
        switch self {
            case .noFilter:
                return nil
            case .notSelected:
                return .notSelected
            case .movie:
                return .movie
            case .tvShow:
                return .tvShow
            case .videoGame:
                return .videoGame
        }
    }
    
    // TODO: These strings should be localized
    func filterStringValue() -> String {
        switch self {
        case .noFilter:
            return "Show Everything"
        case .notSelected:
            return "Only Not Selected"
        case .movie:
            return "Only Movies"
        case .tvShow:
            return "Only TV Shows"
        case .videoGame:
            return "Only Video Games"
        }
    }
    
    // TODO: These strings should be localized
    func headerStringValue() -> String {
        switch self {
        case .noFilter:
            return "Stuff"
        case .notSelected:
            return "Unknown"
        case .movie:
            return "Movies"
        case .tvShow:
            return "TV Shows"
        case .videoGame:
            return "Video Games"
        }
    }
}
