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
    
    private enum CodingKeys: String, CodingKey {
        case people
    }
    
    init(user: User, items: [Item]?, people: [UserData]?) {
        self.people = people ?? [UserData]()
        super.init(user: user, items: items, version: nil)
    }
        
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.people = try container.decode([UserData].self, forKey: .people)
        try super.init(from: decoder)
    }
}
