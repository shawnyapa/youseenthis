//
//  ViewUserViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/21/22.
//

import Foundation
import Combine

class ViewUserViewModel: ObservableObject {
    
    var modelService: (LogInService & UserService)
    @Published var user: User
    @Published var loggedInUser: User?
    var loggedOutUserSubject =  PassthroughSubject<Void, Never>()
    var cancellables = Set<AnyCancellable>()
    var logoutButtonString: String {
        if user.username.isEmpty {
            return "Unavailable"
        } else {
            return "Log Out"
        }
    }
    
    init(user: User,
         modelService: (LogInService & UserService) = ServiceFactory.makeServices(),
         loggedInUser: User?) {
        self.user = user
        self.modelService = modelService
        if let loggedInUser = loggedInUser {
            self.loggedInUser = loggedInUser
        } else {
            self.loggedInUser = self.modelService.loggedInUser()
        }
    }
    
    func displayedUser() -> User? {
        loggedInUser
    }
    
    func logoutButtonPressed() {
        modelService.logoutUser()
        self.loggedInUser = nil
        loggedOutUserSubject.send()
    }
    
    func createEditUserViewModel() -> EditUserViewModel {
        let editUserVM = EditUserViewModel(user: user)
        onUpdateUser(subject: editUserVM.updateUserSubject)
        
        return editUserVM
    }
    
    func onUpdateUser(subject: PassthroughSubject<String, Never>) {
        subject.sink { username in
            let user = self.modelService.getUser(for: username)
            guard let user = user else {
                self.user = User.newBlankUser()
                return
            }
            self.user = user
        }
        .store(in: &cancellables)
    }
}
