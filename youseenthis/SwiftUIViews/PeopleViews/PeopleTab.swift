//
//  PeopleTab.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/13/22.
//

import SwiftUI

struct PeopleTab: View {
    @Binding var primaryUser: User
    var peopleList: [User]
    var body: some View {
        VStack(alignment: .leading) {
            PeopleProfileBox(primaryUser: $primaryUser)
                .frame(height: 180.0)
            PeopleList(peopleList: peopleList)
        }
    }
}

struct PeopleTab_Previews: PreviewProvider {
    static var previews: some View {
        let user = User.sampleValue()
        let peopleList = [User.sampleValue(),User.sampleValue()]
        PeopleTab(primaryUser: .constant(user), peopleList: peopleList)
    }
}
