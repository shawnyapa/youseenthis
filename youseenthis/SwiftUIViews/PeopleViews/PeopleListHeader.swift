//
//  PeopleListHeader.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/14/22.
//

import SwiftUI

struct PeopleListHeader: View {
    @State private var showShareSheet = false
    let primaryUserData = Coordinator.shared.primaryUserData
    var body: some View {
        HStack {
            Text(ViewStrings.people)
            Spacer()
            Button(action: {
                self.showShareSheet = true
            }, label: {Image(systemName: SystemImage.create.rawValue)})
        }
        .sheet(isPresented: $showShareSheet) {
            let message = "Add me to your People Listing"
            let url = ExportUtility.exportUserDataWithUrl(userData: primaryUserData)
            ShareSheet(activityItems: [message, url])
        }
    }
}

struct PeopleListHeader_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListHeader()
    }
}
