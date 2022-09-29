//
//  UserProfileView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 4/30/22.
//

import SwiftUI
import Combine

struct ViewUserView: View {
    @State private var showEditUser: Bool = false
    @ObservedObject var viewUserVM : ViewUserViewModel
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text("\(ViewStrings.username):")
                        .font(.headline)
                    Text(viewUserVM.loggedInUser.username)
                        .font(.body)
                    Spacer()
                }
                Divider()
                HStack {
                    Text("\(ViewStrings.firstName):")
                        .font(.headline)
                    Text(viewUserVM.loggedInUser.firstName)
                        .font(.body)
                    Spacer()
                }
                Divider()
                HStack {
                    Text("\(ViewStrings.lastName):")
                        .font(.headline)
                    Text(viewUserVM.loggedInUser.lastName)
                        .font(.body)
                    Spacer()
                }
                Divider()
                HStack {
                    Text("\(ViewStrings.email):")
                        .font(.headline)
                    Text(viewUserVM.loggedInUser.email)
                        .font(.body)
                    Spacer()
                }
                UserAboutMeField(aboutMe: viewUserVM.loggedInUser.aboutMe)
                Divider()
                HStack {
                    Spacer()
                    Button(viewUserVM.logoutButtonString) {
                        viewUserVM.logoutButtonPressed()
                    }
                    Spacer()
                }
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
        let exampleUser = ExampleData.createExampleUser()
        let viewUserVM = ViewUserViewModel(loggedInUser: exampleUser)
        ViewUserView(viewUserVM: viewUserVM)
    }
}
