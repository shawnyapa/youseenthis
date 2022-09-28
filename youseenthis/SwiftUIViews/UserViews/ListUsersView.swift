//
//  ListUsersView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/28/22.
//

import SwiftUI

struct ListUsersView: View {
    var users: [User]
    var body: some View {
        List {
            if users.count == 0 {
                EmptyItemList()
            } else {
                ForEach(users) { user in
                    HStack {
                        Text(user.username)
                        Divider()
                        Text(user.firstName + " " + user.lastName)
                        Spacer()
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

struct ListUsersView_Previews: PreviewProvider {
    static var previews: some View {
        let users = ExampleData.createExampleUsersForLists()
        ListUsersView(users: users)
    }
}
