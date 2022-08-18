//
//  PrimaryUserData.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/17/22.
//

import Foundation

protocol HasPeople {
    var people: [UserData] { get set}
}

class PrimaryUserData: UserData, HasPeople {
    // TODO: Implement PeopleInvitations
    @Published var people: [UserData]
    
    init(user: User, items: [Item]?, people: [UserData]?) {
        self.people = people ?? [UserData]()
        super.init(user: user, items: items)        
    }
}
