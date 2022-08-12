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
    case willWatch = "star"
    case watching = "eye"
    case didWatch = "checkmark"
    case no_Filter_Sort_Selection = "infinity"
    case filter_off = "line.3.horizontal.decrease.circle"
    case filter_on = "line.3.horizontal.decrease.circle.fill"
    case sort = "arrow.up.arrow.down.circle"
}

//TODO These strings should be localized
struct ViewStrings {
    static let title = "Title"
    static let status = "Status"
    static let type = "Type"
    static let emptyList = "You got Nothin'"
    static let username = "Username"
    static let firstName = "First Name"
    static let lastName = "Last Name"
    static let email = "Email"
}

