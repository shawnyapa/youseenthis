//
//  ItemType.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/13/22.
//

import Foundation
import SwiftUI

enum ItemType: Int, Hashable, Codable, CaseIterable, Identifiable {
    case notSelected
    case movie
    case tvShow
    case videoGame
    
    var id: Int { self.rawValue }
    
    // TODO: These strings should be localized
    func stringValue() -> String {
        switch self{
        case .notSelected:
            return "Not Selected"
        case .movie:
            return "Movie"
        case .tvShow:
            return "TV Show"
        case .videoGame:
            return "Video Game"
        }
    }
    
    func imageNamed() -> String {
        switch self{
        case .notSelected:
            return SystemImage.notSelected.rawValue
        case .movie:
            return SystemImage.movie.rawValue
        case .tvShow:
            return SystemImage.tvShow.rawValue
        case .videoGame:
            return SystemImage.videoGame.rawValue
        }
    }
}
