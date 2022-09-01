//
//  UserLandingView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/21/22.
//

import SwiftUI

struct UserLandingView: View {
    @Binding var primaryUser: User
    @Binding var viewedUser: User
    @Binding var people: [UserData]
    @Binding var items: [Item]
    @State private var itemSortType: ItemSortType = .titleAscending
    @State private var filterItemType: FilterItemType = .noFilter
    @State private var filterItemStatus: FilterItemStatus = .noFilter
    @State private var selectedTags: [String] = [String]()
    @State private var existingTags: [String] = [String]() // TODO: Bug Fix for adding New Tags to Items updating Filter
    var body: some View {
        ItemList(primaryUser: $primaryUser, viewedUser: $viewedUser, people: $people, items: $items, itemSortType: $itemSortType, filterItemType: $filterItemType, filterItemStatus: $filterItemStatus, selectedTags: $selectedTags, existingTags: $existingTags)
    }
}

struct UserLandingView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = ExampleData.createUserDataWithItems()
        let people = ExampleData.createPeople()
        UserLandingView(primaryUser: .constant(userData.user), viewedUser: .constant(userData.user), people: .constant(people) ,items: .constant(userData.items))
    }
}
