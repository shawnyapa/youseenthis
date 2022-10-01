//
//  UserProfileForm.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/29/22.
//

import SwiftUI

struct EditUserView: View {
    @Binding var showEditUser: Bool
    @ObservedObject var editUserVM: EditUserViewModel
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text(ViewStrings.username)) {
                    TextField("\(ViewStrings.username)", text:$editUserVM.user.username)
                }
                Section(header: Text(ViewStrings.firstName)) {
                    TextField("\(ViewStrings.firstName)", text:$editUserVM.user.firstName)
                }
                Section(header: Text(ViewStrings.lastName)) {
                    TextField("\(ViewStrings.lastName)", text:$editUserVM.user.lastName)
                }
                Section(header: Text(ViewStrings.email)) {
                    TextField("\(ViewStrings.email)", text:$editUserVM.user.email)
                }
                Section(header: Text(ViewStrings.aboutMe)) {
                    TextEditor(text: $editUserVM.user.aboutMe)
                        .frame(height: 150, alignment: .top)
                }
            }
            .navigationTitle(ViewStrings.editProfile)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(SystemColors.dankyAccentColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        editUserVM.savePrimaryUser()
                        showEditUser.toggle()
                    }, label: {
                        Text(ViewStrings.update)
                    })
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        showEditUser.toggle()
                    }, label: {
                        Text(ViewStrings.cancel)
                    })
                }
            }
        }
    }
}

struct EditUserView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User.sampleValue()
        let mockServices = MockManager.shared
        let editUserVM = EditUserViewModel(userService: mockServices, user: user)
        EditUserView(showEditUser: .constant(true), editUserVM: editUserVM)
    }
}
