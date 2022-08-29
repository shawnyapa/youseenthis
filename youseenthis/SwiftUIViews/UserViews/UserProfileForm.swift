//
//  UserProfileForm.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/29/22.
//

import SwiftUI

struct UserProfileForm: View {
    @State private var mode: UserEditMode = .edit
    @State var user: User   // TODO: Fix this @State property wrapper
    var body: some View {
        Form {
            Section(header: Text(ViewStrings.username)) {
                TextField("\(ViewStrings.username)", text:$user.username)
            }
            Section(header: Text(ViewStrings.firstName)) {
                TextField("\(ViewStrings.firstName)", text:$user.firstName)
            }
            Section(header: Text(ViewStrings.lastName)) {
                TextField("\(ViewStrings.lastName)", text:$user.lastName)
            }
            Section(header: Text(ViewStrings.email)) {
                TextField("\(ViewStrings.email)", text:$user.email)
            }
            Section(header: Text(ViewStrings.aboutMe)) {
                TextEditor(text: $user.aboutMe)
                    .frame(height: 150, alignment: .top)
            }
        }
        .navigationTitle(ViewStrings.userProfile)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                UserProfileFinishedButton(mode: .edit, user: user)
            }
        }
    }
}

struct UserProfileForm_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileForm(user: User.newBlankUser())
    }
}
