//
//  FollowViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/27/22.
//

import Foundation

class FollowViewModel: ObservableObject {
    
    var modelService: (LogInService & UserService & FollowService)
    var loggedInUser: User
    @Published var followers: [User]
    @Published var following: [User]
    
    init(modelService: (LogInService & UserService & FollowService) = ServiceFactory.makeServices(),
         loggedInuser: User,
         followers: [User],
         following: [User]) {
        self.modelService = modelService
        self.loggedInUser = loggedInuser
        self.followers = followers
        self.following = following
    }
    
}
