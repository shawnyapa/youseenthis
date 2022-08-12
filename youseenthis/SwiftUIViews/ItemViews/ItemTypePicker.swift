//
//  ItemTypePicker.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/12/22.
//

import SwiftUI

struct ItemTypePicker: View {
    @Binding var item: Item
    var body: some View {
        Picker("Type:", selection: $item.itemType) {
            ForEach (ItemType.allCases) { type in
                HStack {
                    ItemTypeImage(itemType: type)
                    Text(type.stringValue())
                }.tag(type)
            }
        }
    }
}

struct ItemTypePicker_Previews: PreviewProvider {
    static var previews: some View {
        let user = ExampleData.createUserDataWithItems()
        let item = user.items.first!
        ItemTypePicker(item: .constant(item))
    }
}
