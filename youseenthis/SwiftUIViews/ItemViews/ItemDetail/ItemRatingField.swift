//
//  ItemRatingField.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/26/22.
//

import SwiftUI

struct ItemRatingField: View {
    @Binding var mode: ItemEditMode
    @Binding var item: Item
    var body: some View {
        VStack {
            Divider()
            HStack {
                Text("\(ViewStrings.rating):")
                    .font(.headline)
                if mode == .view {
                    let rating = item.rating
                    ItemRatingImage(itemRating: rating)
                    Text(rating.stringValue())
                        .font(.subheadline)
                } else if mode == .edit || mode == .create {
                    ItemRatingPicker(item: $item)
                }
                Spacer()
            }
        }
    }
}

struct ItemRatingField_Previews: PreviewProvider {
    static var previews: some View {
        let userData = ExampleData.createUserDataWithItems()
        let item1 = userData.items[0]
        ItemRatingField(mode: .constant(ItemEditMode.view), item: .constant(item1))
    }
}
