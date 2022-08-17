//
//  UserData.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/5/22.
//

import Foundation

class UserData: ObservableObject {
    @Published var user: User
    @Published var items:[Item]
    var people: [User]
    // TODO: Implement PeopleInvitations
    var version: Semver = Semver(major: 0, minor: 0, patch: 0)
    
    init(user: User, items: [Item]?, people: [User]?) {
        self.user = user
        self.items = items ?? [Item]()
        self.people = people ?? [User]()
    }
}
