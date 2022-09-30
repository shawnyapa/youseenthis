//
//  FollowViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/27/22.
//

import Foundation
import Combine

class FollowViewModel: ObservableObject {
    
    var modelService: (LogInService & UserService & FollowService)
    var loggedInUser: User
    @Published var followers: [Follow] = [Follow]()
    @Published var following: [Follow] = [Follow]()
    var cancellables = Set<AnyCancellable>()
    
    init(modelService: (LogInService & UserService & FollowService) = ServiceFactory.makeServices(),
         loggedInuser: User) {
        self.modelService = modelService
        self.loggedInUser = loggedInuser
        refreshFollows()
    }
    
    func refreshFollows() {
        self.followers = getFollowers()
        self.following = getFollowing()
    }
    
    /// FollowerList Functions
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
    
    /// FollowingList Functions
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
    
    /// AddFollow Functions
    func createAddFollowViewModel() -> AddFollowViewModel {
        let addFollowVM = AddFollowViewModel(loggedInUser: loggedInUser)
        onUpdateFollowLists(subject: addFollowVM.updateFollowingSubject)
        
        return addFollowVM
    }
        
    func onUpdateFollowLists(subject: PassthroughSubject<Void, Never>) {
        subject.sink {
            self.refreshFollows()
        }
        .store(in: &cancellables)
    }
}
