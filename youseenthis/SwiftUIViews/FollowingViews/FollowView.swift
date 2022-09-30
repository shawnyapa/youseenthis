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
            VStack {
                FollowerListView(followerListVM: followVM.createFollowerListViewModel())
                FollowingListView(followingListVM: followVM.createFollowingListViewModel())
                Spacer()
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
