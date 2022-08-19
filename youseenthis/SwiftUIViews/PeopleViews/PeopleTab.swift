//
//  PeopleTab.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/13/22.
//

import SwiftUI

struct PeopleTab: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var primaryUser: User
    @Binding var people: [UserData]
    var body: some View {
        VStack(alignment: .leading) {
            PeopleProfileBox(dismiss: dismiss, primaryUser: $primaryUser)
                .frame(height: 180.0)
            PeopleList(dismiss: dismiss, people: people)
        }
    }
}

struct PeopleTab_Previews: PreviewProvider {
    static var previews: some View {
        let user = User.sampleValue()
        let people = ExampleData.createPeople()
        PeopleTab(primaryUser: .constant(user), people: .constant(people))
    }
}
