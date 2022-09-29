//
//  UserLandingView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/21/22.
//

import SwiftUI

struct HomeScreenView: View {
    @ObservedObject var homeScreenVM: HomeScreenViewModel
    
    var body: some View {
        TabView {
            ListItemsView(listItemsVM: homeScreenVM.createListItemsViewModel())
                .tabItem {
                    Text(ViewStrings.my + " " + ViewStrings.stuff)
                    Image(systemName: SystemImage.list.rawValue)
                }
                .tag(1)
            FollowView(followVM: homeScreenVM.createFollowViewModel())
                .tabItem {
                    Text(ViewStrings.following)
                    Image(systemName: SystemImage.people.rawValue)
                }
                .tag(2)
            ViewUserView(viewUserVM: homeScreenVM.createViewUserViewModel())
                .tabItem {
                    Text(ViewStrings.my + " " + ViewStrings.profile)
                    Image(systemName: SystemImage.profile.rawValue)
                }
                .tag(3)
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        let user = ExampleData.createExampleUser()
        HomeScreenView(homeScreenVM: HomeScreenViewModel(loggedInUser: user))
    }
}
