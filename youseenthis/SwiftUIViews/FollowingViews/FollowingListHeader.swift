//
//  PeopleListHeader.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/14/22.
//

import SwiftUI

struct FollowingListHeader: View {
    @State private var showShareSheet = false
    let primaryUserData = Coordinator.shared.primaryUserData
    var body: some View {
        HStack {
            Text(ViewStrings.following)
            Spacer()
            Button(action: {
                self.showShareSheet = true
            }, label: {Image(systemName: SystemImage.create.rawValue)})
        }
        .sheet(isPresented: $showShareSheet) {
            let message = "Add me to your Following Listing"
            let url = ExportUtility.exportUserDataWithUrl(userData: primaryUserData)
            ShareSheet(activityItems: [message, url])
        }
    }
}

struct FollowingListHeader_Previews: PreviewProvider {
    static var previews: some View {
        FollowingListHeader()
    }
}
