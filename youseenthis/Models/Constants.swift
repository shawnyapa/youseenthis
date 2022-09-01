//
//  Constants.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/12/22.
//

import Foundation
import SwiftUI

enum SystemImage: String {
    case edit = "square.and.pencil"
    case delete = "trash"
    case create = "plus.circle"
    case done = "checkmark.circle"
    case notSelected = "camera.metering.unknown"
    case videoGame = "gamecontroller"
    case movie = "film"
    case tvShow = "tv"
    case wontWatch = "xmark"
    case willWatch = "bookmark"
    case watching = "eye"
    case didWatch = "checkmark"
    case no_Filter_Sort_Selection = "infinity"
    case filter_off = "line.3.horizontal.decrease.circle"
    case filter_on = "line.3.horizontal.decrease.circle.fill"
    case sort_off = "arrow.up.arrow.down.circle"
    case sort_on = "arrow.up.arrow.down.circle.fill"
    case list = "list.star"
    case profile = "person"
    case people = "person.3"
    case arrow_up = "arrow.up"
    case arrow_down = "arrow.down"
    case deleteX = "x.circle"
    case search = "magnifyingglass"
    case tag = "tag"
    case noTag = "tag.slash"
}

// TODO: These strings should be localized
struct ViewStrings {
    static let title = "Title"
    static let status = "Status"
    static let type = "Type"
    static let rating = "Rating"
    static let tags = "Tags"
    static let notes = "Notes"
    static let alphabetical = "A to Z"
    static let sort = "Sort"
    static let filter = "Filter"
    static let emptyItemList = "You got Nothin'"
    static let emptyPeopleList = "You need some friends."
    static let username = "Username"
    static let firstName = "First Name"
    static let lastName = "Last Name"
    static let email = "Email"
    static let aboutMe = "About Me"
    static let profile = "Profile"
    static let people = "People"
    static let userProfile = "User Profile"
    static let your = "Your"
    static let my = "My"
    static let notRated = "Not Rated"
    static let janky = "Janky"
    static let suspect = "Suspect"
    static let meh = "Meh"
    static let solid = "Solid"
    static let danky = "Danky"
    static let statusNotSelected = "Not Selected"
    static let willWatch = "Want to Watch"
    static let watching = "Watching"
    static let didWatch = "Watched"
    static let wontWatch = "Not Interested"
    static let typeNotSelected = "Not Selected"
    static let movie = "Movie"
    static let tvShow = "TV Show"
    static let videoGame = "Video Game"
    static let statusShowEverything = "Show Everything"
    static let statusOnlyNotSelected = "Only Not Selected"
    static let onlyWantToWatch = "Only Want to Watch"
    static let onlyWatching = "Only Watching"
    static let onlyWatched = "Only Watched"
    static let onlyNotInterested = "Only Not Interested"
    static let typeShowEverything = "Show Everything"
    static let typeOnlyNotSelected = "Only Not Selected"
    static let onlyMovies = "Only Movies"
    static let onlyTvshows = "Only TV Shows"
    static let onlyVideoGames = "Only Video Games"
    static let stuff = "Stuff"
    static let unknown = "Unknown"
    static let movies = "Movies"
    static let tvShows = "TV Shows"
    static let videoGames = "Video Games"
    static let newTag = "New Tag"
    static let searchTags = "Search Tags"
}

struct SystemColors {
    static let activeTagFill = Color(UIColor.systemCyan)
    static let deactiveTagFill = Color(UIColor.systemGray)
}
