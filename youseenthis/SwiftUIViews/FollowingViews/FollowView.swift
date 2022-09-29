//
//  FollowView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/27/22.
//

import SwiftUI

struct FollowView: View {
    @ObservedObject var followVM: FollowViewModel
    var body: some View {
        VStack {
            FollowerListView(followerListVM: followVM.createFollowerListViewModel())
            FollowingListView(followingListVM: followVM.createFollowingListViewModel())
            Spacer()
        }
        
        // TODO: Add Z-Layer Overlay Button to Show AddFollowView
    }
}

struct FollowView_Previews: PreviewProvider {
    static var previews: some View {
        let mockServices = MockManager.shared
        let loggedInUser = ExampleData.createExampleUser()
        let followVM = FollowViewModel(modelService: mockServices, loggedInuser: loggedInUser)
        FollowView(followVM: followVM)
    }
}
