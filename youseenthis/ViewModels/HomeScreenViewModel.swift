//
//  HomeScreenViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/19/22.
//

import Foundation

class HomeScreenViewModel: ObservableObject {
    
    var modelService: (UserService & ItemService)
    
    init(modelService: (UserService & ItemService) = ServiceFactory.makeServices()) {
        self.modelService = modelService
    }
    
    func createListItemsViewModel() -> ListItemsViewModel {
        ListItemsViewModel(modelService: modelService)
    }
    
    func createViewUserViewModel() -> ViewUserViewModel {
        let user = modelService.getUser() ?? User.newBlankUser()
        return ViewUserViewModel(user: user)
    }
    
    func createFollowingListViewModel() -> FollowingListViewModel {
        // TODO: use FollowService
        let users = ExampleData.createExampleUsersForFollowing()
        return FollowingListViewModel(following: users)
    }
}
