//
//  ItemRatingPicker.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/24/22.
//

import SwiftUI

struct ItemRatingPicker: View {
    @Binding var itemRating: ItemRating
    var body: some View {
        Picker("\(ViewStrings.rating):", selection: $itemRating) {
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
        ItemRatingPicker(itemRating: .constant(.danky))
    }
}
