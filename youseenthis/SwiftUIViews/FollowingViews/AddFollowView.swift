//
//  AddFollowView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/21/22.
//

import SwiftUI

struct AddFollowView: View {
    @Binding var showAddFollowView: Bool
    @ObservedObject var addFollowVM: AddFollowViewModel
    var body: some View {
        NavigationStack {
            List {
                if addFollowVM.users.count == 0 {
                    EmptyItemList()
                } else {
                    ForEach(addFollowVM.users) { user in
                        HStack {
                            Text(user.username)
                            Spacer()
                            Button(ViewStrings.follow) {
                                addFollowVM.requestFollowButtonPressed(followUsername: user.username)
                                showAddFollowView.toggle()
                            }
                            .buttonStyle(BorderedButtonStyle())
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle(ViewStrings.followUser)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(SystemColors.dankyAccentColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        showAddFollowView.toggle()
                    }, label: {
                        Text(ViewStrings.done)
                    })
                }
            }
        }
    }
}

struct AddFollowView_Previews: PreviewProvider {
    static var previews: some View {
        let mockServices = MockManager.shared
        let loggedInUser = ExampleData.createExampleUser()
        let addFollowVM = AddFollowViewModel(modelService: mockServices, loggedInUser: loggedInUser)
        AddFollowView(showAddFollowView: .constant(true), addFollowVM: addFollowVM)
    }
}
