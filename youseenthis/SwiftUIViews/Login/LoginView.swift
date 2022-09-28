//
//  LoginView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/28/22.
//

import SwiftUI

struct LoginView: View {
    @State private var showCreateUser: Bool = false
    @ObservedObject var loginVM: LoginViewModel
    var body: some View {
        VStack {
            Form {
                TextField("Username", text: $loginVM.username)
                HStack {
                    Spacer()
                    Button("Login", action: {
                        loginVM.loginButtonPressed()
                    })
                    Spacer()
                }
            }
            Divider()
            Button("Create Account", action: {
                showCreateUser.toggle()
            })
            Divider()
            ListUsersView(users: loginVM.users)
            Spacer()
        }
        .sheet(isPresented: $showCreateUser) {
            CreateUserView(showCreateUser: $showCreateUser, createUserVM: loginVM.createUserViewModel())
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let users = ExampleData.createExampleUsersForLists()
        let loginVM = LoginViewModel(users: users)
        LoginView(loginVM: loginVM)
    }
}
