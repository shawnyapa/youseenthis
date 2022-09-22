//
//  PeopleList.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/13/22.
//

import SwiftUI

struct FollowingList: View {
    var dismiss: DismissAction? = nil
    var people: [UserData]
    var userArray: [User] {
        get {
            return people.map { $0.user }
        }
    }
    var body: some View {
        List {
            Section(header: FollowingListHeader()) {
                if userArray.count == 0 {
                    EmptyPeopleList()
                } else {
                    ForEach(userArray) { user in
                        FollowListRow(dismiss: dismiss, person: user)
                    }
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct FollowingList_Previews: PreviewProvider {
    static var previews: some View {
        let people = ExampleData.createEmptyPeople()
        FollowingList(people: people)
    }
}
