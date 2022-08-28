//
//  PeopleProfileBoxHeader.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/14/22.
//

import SwiftUI

struct PeopleProfileBoxHeader: View {
    var primaryUser: User
    var body: some View {
        HStack {
            Text(ViewStrings.profile)
            Spacer()
            NavigationLink {
                UserProfileDetail(canEdit: true, user: primaryUser)
            } label: {
                Image(systemName: SystemImage.edit.rawValue)
            }
        }
    }
}

struct PeopleProfileBoxHeader_Previews: PreviewProvider {
    static var previews: some View {
        let user = User.sampleValue()
        PeopleProfileBoxHeader(primaryUser: user)
    }
}
