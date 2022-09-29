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
            FollowingListView(following: followVM.following)
            FollowerListView(follower: followVM.followers)
            Spacer()
        }
    }
}

struct FollowView_Previews: PreviewProvider {
    static var previews: some View {
        let loggedInUser = ExampleData.createExampleUser()
        let users = ExampleData.createExampleUsersForLists()
        let followVM = FollowViewModel(loggedInuser: loggedInUser, followers: users, following: users)
        FollowView(followVM: followVM)
    }
}
