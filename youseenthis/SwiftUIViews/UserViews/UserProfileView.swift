//
//  UserProfileView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 4/30/22.
//

import SwiftUI

struct UserProfileView: View {
    enum Mode: String {
        case create
        case edit
        case view
    }
    var canEdit: Bool = false
    @State var mode: Mode
    @Binding var user: User
    var body: some View {
        VStack(alignment: .leading) {
            UserProfileRow(title: ViewStrings.username, userValue: $user.username)
            Divider()
            UserProfileRow(title: ViewStrings.firstName, userValue: $user.firstName)
            Divider()
            UserProfileRow(title: ViewStrings.lastName, userValue: $user.lastName)
            Divider()
            UserProfileRow(title: ViewStrings.email, userValue: $user.email)
            Divider()
            Spacer()
        }
        .padding(.all)
        .navigationTitle("User Profile")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if mode == .view, canEdit == true {
                    Button(action: { mode = .edit }) {
                        Image(systemName: SystemImage.edit.rawValue)
                    }
                } else if mode == .edit {
                    UserProfileFinishedButton(mode: .edit, user: user)
                } else if mode == .create {
                    UserProfileFinishedButton(mode: .create, user: user)
                } else {
                    AnyView(EmptyView())
                }
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(mode: .view, user: .constant(User.sampleValue()))
    }
}
