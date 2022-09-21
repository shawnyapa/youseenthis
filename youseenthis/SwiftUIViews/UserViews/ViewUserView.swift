//
//  UserProfileView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 4/30/22.
//

import SwiftUI

struct ViewUserView: View {
    @State private var showEditUser: Bool = false
    @ObservedObject var viewUserVM : ViewUserViewModel
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text("\(ViewStrings.username):")
                        .font(.headline)
                    Text(viewUserVM.user.username)
                        .font(.body)
                    Spacer()
                }
                Divider()
                HStack {
                    Text("\(ViewStrings.firstName):")
                        .font(.headline)
                    Text(viewUserVM.user.firstName)
                        .font(.body)
                    Spacer()
                }
                Divider()
                HStack {
                    Text("\(ViewStrings.lastName):")
                        .font(.headline)
                    Text(viewUserVM.user.lastName)
                        .font(.body)
                    Spacer()
                }
                Divider()
                HStack {
                    Text("\(ViewStrings.email):")
                        .font(.headline)
                    Text(viewUserVM.user.email)
                        .font(.body)
                    Spacer()
                }
                UserAboutMeField(aboutMe: viewUserVM.user.aboutMe)
            }
            .padding()
            .navigationTitle(ViewStrings.userProfile)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        showEditUser.toggle()
                    }, label: {
                        Text(ViewStrings.edit)
                    })
                }
            }
            .sheet(isPresented: $showEditUser) {
                EditUserView(showEditUser: $showEditUser, editUserVM: viewUserVM.createEditUserViewModel())
            }
        }
    }
}

struct ViewUserView_Previews: PreviewProvider {
    static var previews: some View {
        let viewUserVM = ViewUserViewModel(user: ExampleData.createExampleUser())
        ViewUserView(viewUserVM: viewUserVM)
    }
}
