//
//  CreateUserViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/27/22.
//

import Foundation
import Combine

class CreateUserViewModel: ObservableObject {
    
    var userService: UserService
    @Published var user: User
    let updateUsersSubject = PassthroughSubject<Void, Never>()
    
    init (userService: UserService = ServiceFactory.makeServices(), user: User) {
        self.userService = userService
        self.user = user
    }
    
    func savePrimaryUser() {
        userService.saveUser(user: user)
        updateUsersSubject.send()
    }
}
