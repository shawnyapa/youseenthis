//
//  LoginViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/28/22.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    var modelService: (LogInService & UserService)
    @Published var users: [User]
    @Published var username: String = ""
    @Published var loggedInUser: User?
    var loggedInUserPassthrough = PassthroughSubject<User, Never>()
    var cancellables = Set<AnyCancellable>()
    
    init(modelService: (LogInService & UserService) = ServiceFactory.makeServices(), users: [User]? = nil) {
        self.modelService = modelService
        if let users = users {
            self.users = users
        } else {
            self.users = modelService.returnAllUsers()
        }
    }
    
    func refreshUsers() {
        self.users = modelService.returnAllUsers()
    }
    
    func createUserViewModel() -> CreateUserViewModel {
        let createUserVM = CreateUserViewModel(user: User.newBlankUser())
        onUpdateUsers(subject: createUserVM.updateUsersSubject)
        
        return createUserVM
    }
    
    func onUpdateUsers(subject: PassthroughSubject<Void, Never>) {
        subject.sink { () in
            self.refreshUsers()
        }
        .store(in: &cancellables)
    }
    
    func loginButtonPressed() {
        if modelService.loggedInUser() == nil {
            if !username.isEmpty {
                if modelService.logUserIn(username: username), let loggedInUser = modelService.loggedInUser() {
                    self.loggedInUser = loggedInUser
                    loggedInUserPassthrough.send(loggedInUser)
                }
            }
        }
    }
}
