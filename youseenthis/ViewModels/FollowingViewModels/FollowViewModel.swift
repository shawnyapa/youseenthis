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
    var followerListVM: FollowerListViewModel?
    var followingListVM: FollowingListViewModel?
    var cancellables = Set<AnyCancellable>()
    
    init(modelService: (LogInService & UserService & FollowService) = ServiceFactory.makeServices(),
         loggedInuser: User) {
        self.modelService = modelService
        self.loggedInUser = loggedInuser
    }
    
    func createFollowerListViewModel() -> FollowerListViewModel {
        let followerListVM = FollowerListViewModel(loggedInuser: loggedInUser)
        self.followerListVM = followerListVM
        return followerListVM
    }
    
    func createFollowingListViewModel() -> FollowingListViewModel {
        let followingListVM = FollowingListViewModel(loggedInuser: loggedInUser)
        self.followingListVM = followingListVM
        return followingListVM
    }
    
    func createAddFollowViewModel() -> AddFollowViewModel {
        let addFollowVM = AddFollowViewModel(loggedInUser: loggedInUser)
        onUpdateFollowLists(subject: addFollowVM.updateFollowingSubject)
        
        return addFollowVM
    }
    
    func onUpdateFollowLists(subject: PassthroughSubject<Void, Never>) {
        subject.sink {
            self.updateFollowLists()
        }
        .store(in: &cancellables)
    }
    
    func updateFollowLists() {
        followerListVM?.refreshFollows()
        followingListVM?.refreshFollows()
    }
}
