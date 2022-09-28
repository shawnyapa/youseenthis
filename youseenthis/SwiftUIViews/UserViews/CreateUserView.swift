//
//  CreateUserView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/27/22.
//

import SwiftUI

struct CreateUserView: View {
    @Binding var showCreateUser: Bool
    @ObservedObject var createUserVM: CreateUserViewModel
    var body: some View {
        VStack {
            HStack {
                Button(ViewStrings.cancel) {
                    showCreateUser.toggle()
                }
                .buttonStyle(BorderlessButtonStyle())
                Spacer()
                Button(ViewStrings.create) {
                    createUserVM.savePrimaryUser()
                    showCreateUser.toggle()
                }
                .buttonStyle(BorderlessButtonStyle())
            }
            .padding()
            Form {
                Section(header: Text(ViewStrings.username)) {
                    TextField("\(ViewStrings.username)", text:$createUserVM.user.username)
                }
                Section(header: Text(ViewStrings.firstName)) {
                    TextField("\(ViewStrings.firstName)", text:$createUserVM.user.firstName)
                }
                Section(header: Text(ViewStrings.lastName)) {
                    TextField("\(ViewStrings.lastName)", text:$createUserVM.user.lastName)
                }
                Section(header: Text(ViewStrings.email)) {
                    TextField("\(ViewStrings.email)", text:$createUserVM.user.email)
                }
                Section(header: Text(ViewStrings.aboutMe)) {
                    TextEditor(text: $createUserVM.user.aboutMe)
                        .frame(height: 150, alignment: .top)
                }
            }
        }
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User.sampleValue()
        let createUserVM = CreateUserViewModel(user: user)
        CreateUserView(showCreateUser: .constant(true), createUserVM: createUserVM)
    }
}
