//
//  PeopleTab.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/13/22.
//

import SwiftUI

struct FollowingView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var people: [UserData]
    var body: some View {
        VStack(alignment: .leading) {
            FollowingList(dismiss: dismiss, people: people)
        }
    }
}

struct FollowingView_Previews: PreviewProvider {
    static var previews: some View {
        let people = ExampleData.createPeople()
        FollowingView(people: .constant(people))
    }
}
