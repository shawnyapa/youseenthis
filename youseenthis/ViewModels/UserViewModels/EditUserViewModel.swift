//
//  EditUserViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/21/22.
//

import Foundation
import Combine

class EditUserViewModel: ObservableObject {
    
    let updateUserSubject = PassthroughSubject<Void, Never>()
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func savePrimaryUser() {
        StorageManager.savePrimaryUser(user: user)
        updateUserSubject.send()
    }
}
