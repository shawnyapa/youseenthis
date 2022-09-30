//
//  FollowView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/27/22.
//

import SwiftUI

struct FollowView: View {
    @State private var showAddFollowView: Bool = false
    @ObservedObject var followVM: FollowViewModel
    var body: some View {
        ZStack {
            NavigationStack {
                List {
                    Section(ViewStrings.followers) {
                        if followVM.followers.count == 0 {
                            EmptyPeopleList()
                        } else {
                            ForEach(followVM.followers) { follow in
                                HStack {
                                    Text(follow.primaryUsername)
                                    Spacer()
                                    /// Buttons
                                    if follow.isApproved {
                                        Button(ViewStrings.revoke, role: .destructive) {
                                            followVM.revokeButtonPressed(followId: follow.id)
                                        }
                                        .buttonStyle(BorderedButtonStyle())
                                    } else {
                                        Button(ViewStrings.approve) {
                                            followVM.approveButtonPressed(followId: follow.id)
                                        }
                                        .buttonStyle(BorderedButtonStyle())
                                        Button(ViewStrings.deny, role: .destructive) {
                                            followVM.denyButtonPressed(followId: follow.id)
                                        }
                                        .buttonStyle(BorderedButtonStyle())
                                    }
                                }
                            }
                        }
                        
                    }
                    Section(ViewStrings.following) {
                        if followVM.following.count == 0 {
                            EmptyPeopleList()
                        } else {
                            ForEach(followVM.following) { follow in
                                HStack {
                                    if follow.isApproved, let listItemsVM = followVM.createListItemsViewModel(for: follow.followUsername) {
                                        NavigationLink(follow.followUsername) {
                                            ListItemsView(listItemsVM: listItemsVM)
                                        }
                                    } else {
                                        Text(follow.followUsername)
                                        Spacer()
                                        Text(ViewStrings.approvalPending)
                                    }
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle(ViewStrings.follow)
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()

                    Button(action: {
                        showAddFollowView.toggle()
                    }, label: {
                        Text("+")
                            .font(.system(.largeTitle))
                            .frame(width: 67, height: 60)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7)
                    })
                    .background(Color.purple)
                    .cornerRadius(38.5)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                }
            }
        }
        .sheet(isPresented: $showAddFollowView) {
            AddFollowView(showAddFollowView: $showAddFollowView, addFollowVM: followVM.createAddFollowViewModel())
        }
    }
}

struct FollowView_Previews: PreviewProvider {
    static var previews: some View {
        let mockServices = MockManager.shared
        let loggedInUser = ExampleData.createExampleUser()
        let followVM = FollowViewModel(modelService: mockServices, loggedInuser: loggedInUser)
        FollowView(followVM: followVM)
    }
}
