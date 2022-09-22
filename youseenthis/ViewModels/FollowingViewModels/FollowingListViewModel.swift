//
//  FollowingListViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/22/22.
//

import Foundation

class FollowingListViewModel: ObservableObject {
    
    @Published var following: [User]
    
    init(following: [User]) {
        self.following = following
    }
    
}
