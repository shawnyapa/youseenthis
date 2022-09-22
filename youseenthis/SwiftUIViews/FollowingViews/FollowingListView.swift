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
        NavigationView {
            List {
                Section(header: Text(ViewStrings.following)) {
                    if followingListVM.following.count == 0 {
                        EmptyPeopleList()
                    } else {
                        ForEach(followingListVM.following) { user in
                            Text(user.firstName + " " + user.lastName)
                        }
                    }
                }
            }.listStyle(GroupedListStyle())
        }
    }
}

struct FollowingListView_Previews: PreviewProvider {
    static var previews: some View {
        let followingListVM = FollowingListViewModel(following: ExampleData.createExampleUsersForFollowing())
        FollowingListView(followingListVM: followingListVM)
    }
}
