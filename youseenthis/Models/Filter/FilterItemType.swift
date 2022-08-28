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
    
    func filterStringValue() -> String {
        switch self {
        case .noFilter:
            return ViewStrings.typeShowEverything
        case .notSelected:
            return ViewStrings.typeOnlyNotSelected
        case .movie:
            return ViewStrings.onlyMovies
        case .tvShow:
            return ViewStrings.onlyTvshows
        case .videoGame:
            return ViewStrings.onlyVideoGames
        }
    }
    
    func headerStringValue() -> String {
        switch self {
        case .noFilter:
            return ViewStrings.stuff
        case .notSelected:
            return ViewStrings.unknown
        case .movie:
            return ViewStrings.movies
        case .tvShow:
            return ViewStrings.tvShows
        case .videoGame:
            return ViewStrings.videoGames
        }
    }
}
