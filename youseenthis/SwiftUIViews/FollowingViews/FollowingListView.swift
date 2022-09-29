//
//  PeopleList.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/13/22.
//

import SwiftUI

struct FollowingListView: View {

    @ObservedObject var followingListVM: FollowingListViewModel
    
    var body: some View {
        NavigationStack {
            List {
                if followingListVM.following.count == 0 {
                    EmptyPeopleList()
                } else {
                    ForEach(followingListVM.following) { follow in
                        HStack {
                            if follow.isApproved, let listItemsVM = followingListVM.createListItemsViewModel(for: follow.followUsername) {
                                NavigationLink(follow.followUsername) {
                                    ListItemsView(listItemsVM: listItemsVM)
                                }
                            } else {
                                Text(follow.followUsername)
                                Spacer()
                                Text(ViewStrings.approvalPending)
                            }
                        }
                    }
                }
            }
            .navigationTitle(ViewStrings.following)
            .listStyle(.plain)
        }
    }
}

struct FollowingListView_Previews: PreviewProvider {
    static var previews: some View {
        let mockServices = MockManager.shared
        let loggedInUser = ExampleData.createExampleUser()
        let followingListVM = FollowingListViewModel(modelService: mockServices, loggedInuser: loggedInUser)
        FollowingListView(followingListVM: followingListVM)
    }
}
