//
//  Follow.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/24/22.
//

import Foundation

struct Follow: Identifiable, Codable {
    var id: String
    var primaryUsername: String
    var followUsername: String
    var isApproved: Bool
}
