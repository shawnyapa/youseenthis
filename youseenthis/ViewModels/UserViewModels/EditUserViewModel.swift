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
    @Published var user: User
    let updateUserSubject = PassthroughSubject<String, Never>()

    init(userService: UserService = ServiceFactory.makeServices(), user: User) {
        self.userService = userService
        self.user = user
    }
    
    func savePrimaryUser() {
        userService.saveUser(user: user)
        updateUserSubject.send(user.username)
    }
}
