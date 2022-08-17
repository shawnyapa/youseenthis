//
//  UserLandingView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/21/22.
//

import SwiftUI

struct UserLandingView: View {
    @Binding var user: User
    @Binding var items: [Item]
    @State var filterItemType: FilterItemType = .noFilter
    @State var filterItemStatus: FilterItemStatus = .noFilter
    var body: some View {
        let sortedItems = ItemArraySortAndFilter.sortedItems(items: items, sortType: .titleDescending)
        let filteredItems = ItemArraySortAndFilter.filteredItems(items: sortedItems, itemType: filterItemType.itemTypeForFilterItemType(), itemStatus: filterItemStatus.itemStatusForFilterItemStatus())
        ItemList(primaryUser: user, items: filteredItems, filterItemType: $filterItemType, filterItemStatus: $filterItemStatus)
    }
}

struct UserLandingView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = ExampleData.createUserDataWithItems()
        UserLandingView(user: .constant(userData.user), items: .constant(userData.items))
    }
}
