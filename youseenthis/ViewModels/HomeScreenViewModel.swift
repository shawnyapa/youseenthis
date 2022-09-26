//
//  HomeScreenViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/19/22.
//

import Foundation

class HomeScreenViewModel: ObservableObject {
    
    var modelService: (LogInService & UserService & ItemService)
    
    init(modelService: (LogInService & UserService & ItemService) = ServiceFactory.makeServices()) {
        self.modelService = modelService
    }
    
    func createListItemsViewModel() -> ListItemsViewModel {
        ListItemsViewModel(modelService: modelService)
    }
    
    func createViewUserViewModel() -> ViewUserViewModel {
        let user = modelService.loggedInUser() ?? User.newBlankUser()
        let loggedInUser = modelService.loggedInUser()
        return ViewUserViewModel(user: user, loggedInUser: loggedInUser)
    }
    
    func createFollowingListViewModel() -> FollowingListViewModel {
        // TODO: use FollowService
        let users = ExampleData.createExampleUsersForFollowing()
        return FollowingListViewModel(following: users)
    }
}
