//
//  FollowerListView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/28/22.
//

import SwiftUI

struct FollowerListView: View {
    
    @ObservedObject var followerListVM: FollowerListViewModel
    
    var body: some View {
        NavigationView {
            List {
                if followerListVM.followers.count == 0 {
                    EmptyPeopleList()
                } else {
                    ForEach(followerListVM.followers) { follow in
                        HStack {
                            Text(follow.primaryUsername)
                            Spacer()
                            /// Buttons
                            if follow.isApproved {
                                Button(ViewStrings.revoke, role: .destructive) {
                                    followerListVM.revokeButtonPressed(followId: follow.id)
                                }
                                .buttonStyle(BorderedButtonStyle())
                            } else {
                                Button(ViewStrings.approve) {
                                    followerListVM.approveButtonPressed(followId: follow.id)
                                }
                                .buttonStyle(BorderedButtonStyle())
                                Button(ViewStrings.deny, role: .destructive) {
                                    followerListVM.denyButtonPressed(followId: follow.id)
                                }
                                .buttonStyle(BorderedButtonStyle())
                            }
                        }
                    }
                }
            }
            .navigationTitle(ViewStrings.followers)
            .listStyle(.plain)
        }
    }
}

struct FollowerListView_Previews: PreviewProvider {
    static var previews: some View {
        let mockServices = MockManager.shared
        let loggedInUser = ExampleData.createExampleUser()
        let followerListVM = FollowerListViewModel(modelService: mockServices, loggedInuser: loggedInUser)
        FollowerListView(followerListVM: followerListVM)
    }
}
