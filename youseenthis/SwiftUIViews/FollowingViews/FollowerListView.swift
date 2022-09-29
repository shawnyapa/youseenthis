//
//  FollowerListView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/28/22.
//

import SwiftUI

struct FollowerListView: View {
    
    var follower: [User]
    
    var body: some View {
        NavigationView {
            List {
                if follower.count == 0 {
                    EmptyPeopleList()
                } else {
                    ForEach(follower) { user in
                        Text(user.firstName + " " + user.lastName)
                    }
                }
            }
            .navigationTitle(ViewStrings.followers)
            .listStyle(.plain)
        }
    }
}

struct FollowerListView_Previews: PreviewProvider {
    static var previews: some View {
        let follower = ExampleData.createExampleUsersForLists()
        FollowerListView(follower: follower)
    }
}
