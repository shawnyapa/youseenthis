//
//  RootView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/28/22.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var rootVM: RootViewModel
    var body: some View {
        if let loggedInUser = rootVM.loggedInUser {
            HomeScreenView(homeScreenVM: rootVM.createHomeScreenViewModel(loggedInUser: loggedInUser))
        } else {
            LoginView(loginVM: rootVM.createLoginViewModel())
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        let loggedInUser = ExampleData.createExampleUser()
        let mockServices = MockManager.shared
        RootView(rootVM: RootViewModel(loginService: mockServices, loggedInUser: loggedInUser))
    }
}
