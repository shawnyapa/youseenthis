//
//  PeopleProfileBoxHeader.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/14/22.
//

import SwiftUI

struct PeopleProfileBoxHeader: View {
    var body: some View {
        HStack {
            Text(ViewStrings.profile)
            Spacer()
            Button(action: {}, label: {Image(systemName: SystemImage.edit.rawValue)})
        }
    }
}

struct PeopleProfileBoxHeader_Previews: PreviewProvider {
    static var previews: some View {
        PeopleProfileBoxHeader()
    }
}

// TODO: Planned Navigation for Button
//            UserProfileView(canEdit: true, mode: .view, user: $user)
//                .tabItem {
//                    Image(systemName: SystemImage.people.rawValue)
//                    Text(ViewStrings.people)
//                }
