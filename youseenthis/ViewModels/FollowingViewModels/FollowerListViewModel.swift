//
//  FollowerListViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/29/22.
//

import Foundation

class FollowerListViewModel: ObservableObject {
    
    var modelService: (LogInService & UserService & FollowService)
    var loggedInUser: User
    @Published var followers: [Follow] = [Follow]()
    
    init(modelService: (LogInService & UserService & FollowService) = ServiceFactory.makeServices(),
         loggedInuser: User) {
        self.modelService = modelService
        self.loggedInUser = loggedInuser
        refreshFollows()
    }
        
    func refreshFollows() {
        self.followers = getFollowers()
    }
    
    func getFollowers() -> [Follow] {
        modelService.returnAllFollowRequests(for: loggedInUser.username)
    }
    
    func denyButtonPressed(followId: String) {
        modelService.respondToFollowRequest(followId: followId, approve: false)
        refreshFollows()
    }
    
    func approveButtonPressed(followId: String) {
        modelService.respondToFollowRequest(followId: followId, approve: true)
        refreshFollows()
    }
    
    func revokeButtonPressed(followId: String) {
        modelService.removeRequestToFollow(followId: followId)
        refreshFollows()
    }
    
}
