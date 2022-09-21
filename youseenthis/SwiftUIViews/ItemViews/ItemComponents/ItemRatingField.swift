//
//  ItemRatingField.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/26/22.
//

import SwiftUI

struct ItemRatingField: View {
    var item: Item
    var body: some View {
        VStack {
            Divider()
            HStack {
                Text("\(ViewStrings.rating):")
                    .font(.headline)
                ItemRatingImage(itemRating: item.rating)
                Text(item.rating.stringValue())
                    .font(.subheadline)
                Spacer()
            }
        }
    }
}

struct ItemRatingField_Previews: PreviewProvider {
    static var previews: some View {
        let userData = ExampleData.createUserDataWithItems()
        let item1 = userData.items[0]
        ItemRatingField(item: item1)
    }
}
