//
//  PersonItemsButton.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/19/22.
//

import SwiftUI

struct PersonItemsButton: View {
    var dismiss: DismissAction? = nil
    var user: User
    var body: some View {
        Button(action: {
            Coordinator.shared.showItemsForUserId(userId: user.id)
            dismiss?.callAsFunction()
        }) {
            Image(systemName: SystemImage.list.rawValue)
        }
    }
}

struct PersonItemsButton_Previews: PreviewProvider {
    static var previews: some View {
        let person = User.sampleValue()
        PersonItemsButton(user: person)
    }
}
