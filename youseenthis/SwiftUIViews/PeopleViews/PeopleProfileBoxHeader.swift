//
//  PeopleProfileBoxHeader.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/14/22.
//

import SwiftUI

struct PeopleProfileBoxHeader: View {
    @Binding var primaryUser: User
    var body: some View {
        HStack {
            Text(ViewStrings.profile)
            Spacer()
            NavigationLink {
                //ViewUserView(canEdit: true, user: primaryUser)
                // TODO: Debug UserProfileForm double dismiss issue ^^ 
                //UserProfileForm(user: primaryUser)
            } label: {
                Image(systemName: SystemImage.edit.rawValue)
            }
        }
    }
}

struct PeopleProfileBoxHeader_Previews: PreviewProvider {
    static var previews: some View {
        let user = User.sampleValue()
        PeopleProfileBoxHeader(primaryUser:.constant(user))
    }
}
