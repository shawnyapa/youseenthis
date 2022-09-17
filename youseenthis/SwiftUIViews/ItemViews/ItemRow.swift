//
//  ItemRow.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/20/22.
//

import SwiftUI

struct ItemRow: View {
    var item: Item
    var body: some View {
        HStack(alignment: .center) {
            ItemTypeImage(itemType: item.itemType)
                .frame(width: 20, height: nil, alignment: .center)
            Divider()
            Text(item.title)
                .multilineTextAlignment(.leading)
            Spacer()
            Divider()
            ItemRatingImage(itemRating: item.rating)
                .frame(width: 20, height: nil, alignment: .center)
                .padding(6)
            Divider()
            ItemStatusImage(itemStatus: item.itemStatus)
                .frame(width: 20, height: nil, alignment: .center)
        }
        .padding(6)
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        let userData = ExampleData.createUserDataWithItems()
        ItemRow(item: userData.items[0])
    }
}
