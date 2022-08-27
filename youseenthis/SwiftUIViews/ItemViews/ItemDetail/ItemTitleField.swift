//
//  ItemTitleField.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/26/22.
//

import SwiftUI

struct ItemTitleField: View {
    @Binding var mode: ItemEditMode
    @Binding var item: Item
    var body: some View {
        VStack {
            Divider()
            HStack {
                VStack(alignment: .leading) {
                    Text("\(ViewStrings.title):")
                        .font(.headline)
                    if mode == .view {
                        Text(item.title)
                            .font(.title)
                    } else if mode == .edit || mode == .create {
                        TextField("\(ViewStrings.title)", text:$item.title)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                }
                Spacer()
            }
        }
    }
}

struct ItemTitleField_Previews: PreviewProvider {
    static var previews: some View {
        let userData = ExampleData.createUserDataWithItems()
        let item1 = userData.items[0]
        ItemTitleField(mode: .constant(ItemEditMode.view), item: .constant(item1))
    }
}
