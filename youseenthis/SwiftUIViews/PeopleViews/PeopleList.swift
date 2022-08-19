//
//  PeopleList.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/13/22.
//

import SwiftUI

struct PeopleList: View {
    var dismiss: DismissAction? = nil
    var people: [UserData]
    var userArray: [User] {
        get {
            return people.map { $0.user }
        }
    }
    var body: some View {
        List {
            Section(header: PeopleListHeader()) {
                if userArray.count == 0 {
                    EmptyPeopleList()
                } else {
                    ForEach(userArray) { user in
                        PeopleRow(dismiss: dismiss, person: user)
                    }
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct PeopleList_Previews: PreviewProvider {
    static var previews: some View {
        let people = ExampleData.createEmptyPeople()
        PeopleList(people: people)
    }
}
