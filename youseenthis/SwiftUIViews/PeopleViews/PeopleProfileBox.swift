//
//  PeopleOwnerBox.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/13/22.
//

import SwiftUI

struct PeopleProfileBox: View {
    var owner: User
    var body: some View {
        let ownerName = owner.firstName + " " + owner.lastName
        List {
            Section(header: PeopleProfileBoxHeader()) {
                Text(ownerName)
                    .listRowSeparator(.hidden)
                Text(owner.username)
                    .listRowSeparator(.hidden)
                Text(owner.email)
                    .listRowSeparator(.hidden)
            }
        }.listStyle(GroupedListStyle())
    }
}

struct PeopleOwnerBox_Previews: PreviewProvider {
    static var previews: some View {
        let owner = User.sampleValue()
        PeopleProfileBox(owner: owner)
    }
}
