//
//  AddFollowViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/29/22.
//

import Foundation
import Combine

class AddFollowViewModel: ObservableObject {
    
    var modelService: (LogInService & UserService & FollowService)
    var loggedInUser: User
    var users: [User] = [User]()
    let updateFollowingSubject = PassthroughSubject<Void, Never>()
    
    init(modelService: (LogInService & UserService & FollowService) = ServiceFactory.makeServices(),
         loggedInUser: User) {
        self.modelService = modelService
        self.loggedInUser = loggedInUser
        refreshUsers()
    }
    
    func refreshUsers() {
        users = modelService.returnAllUsers()
    }
    
    func requestFollowButtonPressed(followUsername: String) {
        modelService.requestToFollow(primaryUserId: loggedInUser.username, followUserId: followUsername)
        updateFollowingSubject.send()
    }
}
