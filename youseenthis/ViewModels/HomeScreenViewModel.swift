//
//  HomeScreenViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/19/22.
//

import Foundation
import Combine

class HomeScreenViewModel: ObservableObject {
    
    var modelService: (LogInService & UserService & ItemService & FollowService)
    var loggedInUser: User
    var loggedOutUserSubject = PassthroughSubject<Void, Never>()
    var cancellables = Set<AnyCancellable>()
    
    init(modelService: (LogInService & UserService & ItemService & FollowService) = ServiceFactory.makeServices(), loggedInUser: User) {
        self.modelService = modelService
        self.loggedInUser = loggedInUser
    }
    
    func createListItemsViewModel() -> ListItemsViewModel {
        ListItemsViewModel(modelService: modelService, loggedInUser: loggedInUser, viewedUser: loggedInUser)
    }
    
    func createViewUserViewModel() -> ViewUserViewModel {
        let viewUserVM = ViewUserViewModel(modelService: modelService, loggedInUser: loggedInUser)
        updateLoggedOutUser(subject: viewUserVM.loggedOutUserSubject)
        
        return viewUserVM
    }
    
    func createFollowViewModel() -> FollowViewModel {
        let followViewModel = FollowViewModel(modelService: modelService, loggedInuser: loggedInUser)
        return followViewModel
    }
    
    func updateLoggedOutUser(subject: PassthroughSubject<Void, Never>) {
        subject.sink { () in
            self.loggedOutUserSubject.send()
        }
        .store(in: &cancellables)
    }
}
