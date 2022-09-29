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
    
    init(modelService: (LogInService & UserService & FollowService) = ServiceFactory.makeServices(),
         loggedInuser: User) {
        self.modelService = modelService
        self.loggedInUser = loggedInuser
    }
    
    func createFollowerListViewModel() -> FollowerListViewModel {
        FollowerListViewModel(loggedInuser: loggedInUser)
    }
    
    func createFollowingListViewModel() -> FollowingListViewModel {
        FollowingListViewModel(loggedInuser: loggedInUser)
    }
}
