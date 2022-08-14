//
//  PeopleRow.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/13/22.
//

import SwiftUI

struct PeopleRow: View {
    var person: User
    var body: some View {
        let personText = "\(person.firstName) \(person.lastName)"
        HStack(alignment: .center) {
            Text(personText)
                .multilineTextAlignment(.leading)
        }
        .padding(.all)
    }
}

struct PeopleRow_Previews: PreviewProvider {
    static var previews: some View {
        let person = User.sampleValue()
        PeopleRow(person: person)
    }
}
