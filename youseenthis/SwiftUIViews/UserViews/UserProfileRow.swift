//
//  UserProfileRow.swift
//  youseenthis
//
//  Created by Shawn Yapa on 4/30/22.
//

import SwiftUI

struct UserProfileRow: View {
    var title: String
    @Binding var userValue: String
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .frame(width: 100.0, height: 50.0)
                .fixedSize(horizontal: true, vertical: true)
            Divider()
            TextField(title, text: $userValue)
        }
        .padding([.leading, .trailing])
    }
}

struct UserProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileRow(title: "Username", userValue: .constant("user123"))
    }
}
