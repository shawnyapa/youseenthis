//
//  UserLandingView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/21/22.
//

import SwiftUI

struct HomeScreenView: View {
    @ObservedObject var homeScreenViewModel: HomeScreenViewModel
    
    var body: some View {
        ItemList(listItemsVM: ListItemsViewModel())
    }
}

struct UserLandingView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(homeScreenViewModel: HomeScreenViewModel())
    }
}
