//
//  PeopleRow.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/13/22.
//

import SwiftUI

struct PeopleRow: View {
    var dismiss: DismissAction? = nil
    var person: User
    var body: some View {
        let personText = "\(person.firstName) \(person.lastName)"
        HStack(alignment: .center) {
            Text(personText)
                .multilineTextAlignment(.leading)
            Spacer()
            PersonItemsButton(dismiss: dismiss, user: person)
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
