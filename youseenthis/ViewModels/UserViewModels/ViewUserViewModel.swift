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
    @Published var loggedInUser: User
    var loggedOutUserSubject =  PassthroughSubject<Void, Never>()
    var cancellables = Set<AnyCancellable>()
    var logoutButtonString: String {
        if loggedInUser.username.isEmpty {
            return "Unavailable"
        } else {
            return "Log Out"
        }
    }
    
    init(modelService: (LogInService & UserService) = ServiceFactory.makeServices(),
         loggedInUser: User) {
        self.modelService = modelService
        self.loggedInUser = loggedInUser
    }
    
    func displayedUser() -> User? {
        loggedInUser
    }
    
    func logoutButtonPressed() {
        modelService.logoutUser()
        loggedOutUserSubject.send()
    }
    
    func createEditUserViewModel() -> EditUserViewModel {
        let editUserVM = EditUserViewModel(user: loggedInUser)
        onUpdateUser(subject: editUserVM.updateUserSubject)
        
        return editUserVM
    }
    
    func onUpdateUser(subject: PassthroughSubject<String, Never>) {
        subject.sink { username in
            if let user = self.modelService.getUser(for: username){
                DispatchQueue.main.async {
                    self.loggedInUser = user
                }
            }
        }
        .store(in: &cancellables)
    }
}
