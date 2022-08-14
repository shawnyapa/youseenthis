//
//  PeopleList.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/13/22.
//

import SwiftUI

struct PeopleList: View {
    var peopleList: [User]
    var body: some View {
        if peopleList.count == 0 {
            EmptyPeopleList()
        } else {
            List {
                Section(header: PeopleListHeader()) {
                    ForEach(peopleList) { person in
                        PeopleRow(person: person)
                    }
                }
            }.listStyle(GroupedListStyle())
        }
    }
}

struct PeopleList_Previews: PreviewProvider {
    static var previews: some View {
        let peopleList = [User.sampleValue(),User.sampleValue()]
        PeopleList(peopleList: peopleList)
    }
}
