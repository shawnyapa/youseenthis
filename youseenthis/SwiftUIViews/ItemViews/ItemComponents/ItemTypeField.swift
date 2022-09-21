//
//  ItemTypeField.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/26/22.
//

import SwiftUI

struct ItemTypeField: View {
    var item: Item
    var body: some View {
        VStack {
            Divider()
            HStack {
                Text("\(ViewStrings.type):")
                    .font(.headline)
                ItemTypeImage(itemType: item.itemType)
                Text(item.itemType.stringValue())
                    .font(.subheadline)
                Spacer()
            }
        }
    }
}

struct ItemTypeField_Previews: PreviewProvider {
    static var previews: some View {
        let userData = ExampleData.createUserDataWithItems()
        let item1 = userData.items[0]
        ItemTypeField(item: item1)
    }
}
