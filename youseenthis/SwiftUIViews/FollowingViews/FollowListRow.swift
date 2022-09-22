//
//  PeopleRow.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/13/22.
//

import SwiftUI

struct FollowListRow: View {
    var dismiss: DismissAction? = nil
    var person: User
    var body: some View {
        let personText = "\(person.firstName) \(person.lastName)"
        HStack(alignment: .center) {
            Text(personText)
                .multilineTextAlignment(.leading)
            Spacer()
            PersonItemsButton(dismiss: dismiss, user: person)
                .buttonStyle(BorderlessButtonStyle())
            
        }
        .padding(.all)
    }
}

struct FollowListRow_Previews: PreviewProvider {
    static var previews: some View {
        let person = User.sampleValue()
        FollowListRow(person: person)
    }
}
