//
//  HomeScreenViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/19/22.
//

import Foundation

class HomeScreenViewModel: ObservableObject {
    
    init() {}
    
    func createListItemsViewModel() -> ListItemsViewModel {
        ListItemsViewModel()
    }
    
    func createViewUserViewModel() -> ViewUserViewModel {
        let user = StorageManager.getPrimaryUser() ?? User.newBlankUser()
        return ViewUserViewModel(user: user)
    }
}
