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
    let updateUsersSubject = PassthroughSubject<Void, Never>()
    @Published var user: User
    
    init(user: User, userService: UserService = ServiceFactory.makeServices()) {
        self.user = user
        self.userService = userService
    }
    
    func savePrimaryUser() {
        userService.saveUser(user: user)
        updateUsersSubject.send()
    }
}
