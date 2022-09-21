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
            ViewUserView(viewUserVM: homeScreenVM.createViewUserViewModel())
                .tabItem {
                    Text(ViewStrings.my + " " + ViewStrings.profile)
                    Image(systemName: SystemImage.profile.rawValue)
                }
                .tag(2)
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(homeScreenVM: HomeScreenViewModel())
    }
}
