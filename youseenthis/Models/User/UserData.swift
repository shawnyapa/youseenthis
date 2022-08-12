//
//  UserData.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/5/22.
//

import Foundation

class UserData: ObservableObject {
    var user: User
    @Published var items:[Item]
    
    init(user: User, items: [Item]?) {
        self.user = user
        if let items = items {
            self.items = items
        } else {
            self.items = [Item]()
        }
    }
}
