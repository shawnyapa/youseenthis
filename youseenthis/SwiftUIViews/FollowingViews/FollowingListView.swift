//
//  PeopleList.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/13/22.
//

import SwiftUI

struct FollowingListView: View {

    var following: [User]
    
    var body: some View {
        NavigationView {
            List {
                if following.count == 0 {
                    EmptyPeopleList()
                } else {
                    ForEach(following) { user in
                        Text(user.firstName + " " + user.lastName)
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
        let following = ExampleData.createExampleUsersForLists()
        FollowingListView(following: following)
    }
}
