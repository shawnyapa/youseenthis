//
//  ItemRatingPicker.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/24/22.
//

import SwiftUI

struct ItemRatingPicker: View {
    @Binding var item: Item
    var body: some View {
        Picker("\(ViewStrings.rating):", selection: $item.rating) {
            ForEach (ItemRating.allCases.reversed()) { rating in
                HStack {
                    Text(rating.stringValue())
                    ItemRatingImage(itemRating: rating)
                }.tag(rating)
            }
        }
    }
}

struct ItemRatingPicker_Previews: PreviewProvider {
    static var previews: some View {
        let user = ExampleData.createUserDataWithItems()
        let item = user.items[1]
        ItemRatingPicker(item: .constant(item))
    }
}
