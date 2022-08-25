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
        Picker("Rating:", selection: $item.rating) {
            ForEach (ItemRating.allCases) { rating in
                HStack {
                    Text(rating.intDisplay() + "  " + rating.stringValue())
                }.tag(rating)
            }
        }
    }
}

struct ItemRatingPicker_Previews: PreviewProvider {
    static var previews: some View {
        let user = ExampleData.createUserDataWithItems()
        let item = user.items.first!
        ItemRatingPicker(item: .constant(item))
    }
}
