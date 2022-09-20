//
//  ItemStatusField.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/26/22.
//

import SwiftUI

struct ItemStatusField: View {
    @Binding var mode: ItemEditMode
    @Binding var item: Item
    var body: some View {
        VStack {
            Divider()
            HStack {
                Text("\(ViewStrings.status):")
                    .font(.headline)
                if mode == .view {
                    ItemStatusImage(itemStatus: item.itemStatus)
                    Text(item.itemStatus.stringValue())
                        .font(.subheadline)
                } else if mode == .edit || mode == .create {
                    ItemStatusPicker(itemStatus: $item.itemStatus)
                }
                Spacer()
            }
        }
    }
}

struct ItemStatusField_Previews: PreviewProvider {
    static var previews: some View {
        let userData = ExampleData.createUserDataWithItems()
        let item1 = userData.items[0]
        ItemStatusField(mode: .constant(ItemEditMode.view), item: .constant(item1))
    }
}
