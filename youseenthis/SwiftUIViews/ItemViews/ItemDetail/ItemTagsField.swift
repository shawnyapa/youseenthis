//
//  ItemTagsField.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/31/22.
//

import SwiftUI

struct ItemTagsField: View {
    @Binding var mode: ItemEditMode
    @Binding var item: Item
    var body: some View {
        VStack {
            Divider()
                if mode == .view, !item.tags.isEmpty {
                    TagsView(tags: item.tags)
                } else if mode == .edit || mode == .create {
                    TagsEditor(tags: $item.tags)
                } else {
                    HStack {
                        Image(systemName: SystemImage.noTag.rawValue)
                        Spacer()
                    }
                    
                }
        }
    }
}

struct ItemTagsField_Previews: PreviewProvider {
    static var previews: some View {
        let userData = ExampleData.createUserDataWithItems()
        let item1 = userData.items[3]
        ItemTagsField(mode: .constant(ItemEditMode.edit), item: .constant(item1))
    }
}
