//
//  ViewUserViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/21/22.
//

import Foundation
import Combine

class ViewUserViewModel: ObservableObject {
    
    @Published var user: User
    var cancellables = Set<AnyCancellable>()
    
    init(user: User) {
        self.user = user
    }
    
    func primaryUser() -> User? {
        let primaryUser = StorageManager.getPrimaryUser()
        return primaryUser
    }
    
    func createEditUserViewModel() -> EditUserViewModel {
        let editUserVM = EditUserViewModel(user: user)
        onUpdateUser(subject: editUserVM.updateUserSubject)
        
        return editUserVM
    }
    
    func onUpdateUser(subject: PassthroughSubject<Void, Never>) {
        subject.sink { () in
            self.user = self.primaryUser() ?? User.newBlankUser()
        }
        .store(in: &cancellables)
    }
}
