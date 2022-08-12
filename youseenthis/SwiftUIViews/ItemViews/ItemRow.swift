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
            Text(item.title)
                .multilineTextAlignment(.leading)
            Spacer()
            Divider()
            ItemTypeImage(itemType: item.itemType)
                .frame(width: 20, height: nil, alignment: .center)
            ItemStatusImage(itemStatus: item.itemStatus)
                .frame(width: 20, height: nil, alignment: .center)
        }
        .padding(.all)
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        let userData = ExampleData.createUserDataWithItems()
        ItemRow(item: userData.items[0])
    }
}
