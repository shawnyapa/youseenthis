//
//  RootViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/28/22.
//

import Foundation
import Combine

class RootViewModel: ObservableObject {
    var loginService: LogInService
    @Published var loggedInUser: User?
    var cancellables = Set<AnyCancellable>()
    
    init(loginService: LogInService = ServiceFactory.makeServices(), loggedInUser: User? = nil) {
        self.loginService = loginService
        if let loggedInUser = loggedInUser {
            self.loggedInUser = loggedInUser
        } else {
            self.loggedInUser = loginService.loggedInUser()
        }
    }
    
    func createHomeScreenViewModel(loggedInUser: User) -> HomeScreenViewModel {
        let homeScreenVM = HomeScreenViewModel(loggedInUser: loggedInUser)
        updateLoggedOutUser(subject: homeScreenVM.loggedOutUserSubject)
        
        return homeScreenVM
    }
    
    func updateLoggedOutUser(subject: PassthroughSubject<Void, Never>) {
        subject.sink { () in
            DispatchQueue.main.async {
                self.loggedInUser = nil
            }
        }
        .store(in: &cancellables)
    }
    
    func createLoginViewModel() -> LoginViewModel {
        let loginVM = LoginViewModel()
        updateLoggedInUser(subject: loginVM.loggedInUserPassthrough)
        
        return loginVM
    }
    
    func updateLoggedInUser(subject: PassthroughSubject<User, Never>) {
        subject.sink { user in
            DispatchQueue.main.async {
                self.loggedInUser = user
            }
        }
        .store(in: &cancellables)
    }
}
