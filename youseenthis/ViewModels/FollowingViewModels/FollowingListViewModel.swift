//
//  FollowingListViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/29/22.
//

import Foundation

class FollowingListViewModel: ObservableObject {
    
    var modelService: (LogInService & UserService & FollowService)
    var loggedInUser: User
    @Published var following: [Follow] = [Follow]()
    
    init(modelService: (LogInService & UserService & FollowService) = ServiceFactory.makeServices(),
         loggedInuser: User) {
        self.modelService = modelService
        self.loggedInUser = loggedInuser
        refreshFollows()
    }
    
    func refreshFollows() {
        self.following = getFollowing()
    }
    
    func getFollowing() -> [Follow] {
        modelService.returnAllFollows(for: loggedInUser.username)
    }
    
    func createListItemsViewModel(for username: String) -> ListItemsViewModel? {
        if let viewedUser = modelService.getUser(for: username) {
            return ListItemsViewModel(loggedInUser: loggedInUser, viewedUser: viewedUser)
        } else {
            return nil
        }
    }
}
