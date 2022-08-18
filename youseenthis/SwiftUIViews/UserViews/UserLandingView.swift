//
//  UserLandingView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/21/22.
//

import SwiftUI

struct UserLandingView: View {
    @Binding var primaryUser: User
    @Binding var people: [UserData]
    @Binding var items: [Item]
    @State var filterItemType: FilterItemType = .noFilter
    @State var filterItemStatus: FilterItemStatus = .noFilter
    var body: some View {
        let sortedItems = ItemArraySortAndFilter.sortedItems(items: items, sortType: .titleDescending)
        let filteredItems = ItemArraySortAndFilter.filteredItems(items: sortedItems, itemType: filterItemType.itemTypeForFilterItemType(), itemStatus: filterItemStatus.itemStatusForFilterItemStatus())
        ItemList(primaryUser: $primaryUser, people: $people, items: filteredItems, filterItemType: $filterItemType, filterItemStatus: $filterItemStatus)
    }
}

struct UserLandingView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = ExampleData.createUserDataWithItems()
        let people = ExampleData.createPeople()
        UserLandingView(primaryUser: .constant(userData.user), people: .constant(people) ,items: .constant(userData.items))
    }
}
