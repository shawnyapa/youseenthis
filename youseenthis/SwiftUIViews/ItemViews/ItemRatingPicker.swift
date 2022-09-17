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
            ForEach (ItemRating.allCases) { rating in
                HStack {
                    // TODO: Investigate Picker Custom Image Display Bug
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
