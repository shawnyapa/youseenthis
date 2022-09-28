//
//  FollowViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/27/22.
//

import Foundation

class FollowViewModel: ObservableObject {
    
    var loggedInUser: User
    @Published var followers: [User]
    @Published var following: [User]
    
    init(loggedInuser: User, followers: [User], following: [User]) {
        self.loggedInUser = loggedInuser
        self.followers = followers
        self.following = following
    }
    
}
