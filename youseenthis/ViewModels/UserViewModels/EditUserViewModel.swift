//
//  EditUserViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/21/22.
//

import Foundation
import Combine

class EditUserViewModel: ObservableObject {
    
    var userService: UserService
    let updateUserSubject = PassthroughSubject<String, Never>()
    @Published var user: User
    
    init(user: User, userService: UserService = ServiceFactory.makeServices()) {
        self.user = user
        self.userService = userService
    }
    
    func savePrimaryUser() {
        userService.saveUser(user: user)
        updateUserSubject.send(user.username)
    }
}
