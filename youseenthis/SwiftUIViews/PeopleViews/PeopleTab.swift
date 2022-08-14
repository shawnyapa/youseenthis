//
//  PeopleTab.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/13/22.
//

import SwiftUI

struct PeopleTab: View {
    var owner: User
    var peopleList: [User]
    var body: some View {
        VStack(alignment: .leading) {
            PeopleProfileBox(owner: owner)
                .frame(height: 180.0)
            PeopleList(peopleList: peopleList)
        }
    }
}

struct PeopleTab_Previews: PreviewProvider {
    static var previews: some View {
        let owner = User.sampleValue()
        let peopleList = [User.sampleValue(),User.sampleValue()]
        PeopleTab(owner: owner, peopleList: peopleList)
    }
}
