//
//  UserProfileView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 4/30/22.
//

import SwiftUI

struct UserProfileDetail: View {
    enum Mode: String {
        case create
        case edit
        case view
    }
    var canEdit: Bool = false
    @State var mode: Mode
    @State var user: User
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(ViewStrings.username):")
                    .font(.headline)
                if mode == .view {
                    Text(user.username)
                        .font(.title)
                } else if mode == .edit || mode == .create {
                    TextField("\(ViewStrings.username)", text:$user.username)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                Spacer()
            }
            HStack {
                Text("\(ViewStrings.firstName):")
                    .font(.headline)
                if mode == .view {
                    Text(user.firstName)
                        .font(.title)
                } else if mode == .edit || mode == .create {
                    TextField("\(ViewStrings.firstName)", text:$user.firstName)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                Spacer()
            }
            HStack {
                Text("\(ViewStrings.lastName):")
                    .font(.headline)
                if mode == .view {
                    Text(user.lastName)
                        .font(.title)
                } else if mode == .edit || mode == .create {
                    TextField("\(ViewStrings.lastName)", text:$user.lastName)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                Spacer()
            }
            HStack {
                Text("\(ViewStrings.email):")
                    .font(.headline)
                if mode == .view {
                    Text(user.email)
                        .font(.title)
                } else if mode == .edit || mode == .create {
                    TextField("\(ViewStrings.email)", text:$user.email)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                Spacer()
            }
        }
        .padding(.bottom)
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
        UserProfileDetail(mode: .view, user: User.sampleValue())
    }
}
