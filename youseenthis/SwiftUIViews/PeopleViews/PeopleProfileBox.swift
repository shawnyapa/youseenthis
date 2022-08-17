//
//  PeopleOwnerBox.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/13/22.
//

import SwiftUI

struct PeopleProfileBox: View {
    @Binding var primaryUser: User
    var body: some View {
        let ownerName = primaryUser.firstName + " " + primaryUser.lastName
        List {
            Section(header: PeopleProfileBoxHeader(primaryUser: primaryUser)) {
                Text(ownerName)
                    .listRowSeparator(.hidden)
                Text(primaryUser.username)
                    .listRowSeparator(.hidden)
                Text(primaryUser.email)
                    .listRowSeparator(.hidden)
            }
        }.listStyle(GroupedListStyle())
    }
}

struct PeopleOwnerBox_Previews: PreviewProvider {
    static var previews: some View {
        let user = User.sampleValue()
        PeopleProfileBox(primaryUser: .constant(user))
    }
}
