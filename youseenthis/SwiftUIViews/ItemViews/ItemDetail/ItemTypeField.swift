//
//  ItemTypeField.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/26/22.
//

import SwiftUI

struct ItemTypeField: View {
    @Binding var mode: ItemEditMode
    @Binding var item: Item
    var body: some View {
        VStack {
            Divider()
            HStack {
                Text("\(ViewStrings.type):")
                    .font(.headline)
                if mode == .view {
                    ItemTypeImage(itemType: item.itemType)
                    Text(item.itemType.stringValue())
                        .font(.subheadline)
                } else if mode == .edit || mode == .create {
                    ItemTypePicker(item: $item)
                }
                Spacer()
            }
        }
    }
}

struct ItemTypeField_Previews: PreviewProvider {
    static var previews: some View {
        let userData = ExampleData.createUserDataWithItems()
        let item1 = userData.items[0]
        ItemTypeField(mode: .constant(ItemEditMode.view), item: .constant(item1))
    }
}
