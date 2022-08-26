//
//  Constants.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/12/22.
//

import Foundation

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
}

// TODO: These strings should be localized
struct ViewStrings {
    static let title = "Title"
    static let status = "Status"
    static let type = "Type"
    static let rating = "Rating"
    static let alphabetical = "A to Z"
    static let sort = "Sort"
    static let filter = "Filter"
    static let emptyItemList = "You got Nothin'"
    static let emptyPeopleList = "You need some friends."
    static let username = "Username"
    static let firstName = "First Name"
    static let lastName = "Last Name"
    static let email = "Email"
    static let profile = "Profile"
    static let people = "People"
}

