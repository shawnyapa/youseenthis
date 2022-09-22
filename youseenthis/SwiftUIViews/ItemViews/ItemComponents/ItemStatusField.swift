//
//  ItemStatusField.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/26/22.
//

import SwiftUI

struct ItemStatusField: View {
    var item: Item
    var body: some View {
        VStack {
            Divider()
            HStack {
                Text("\(ViewStrings.status):")
                    .font(.headline)
                ItemStatusImage(itemStatus: item.itemStatus)
                Text(item.itemStatus.stringValue())
                    .font(.subheadline)
                Spacer()
            }
        }
    }
}

struct ItemStatusField_Previews: PreviewProvider {
    static var previews: some View {
        let item = ExampleData.createItem()
        ItemStatusField(item: item)
    }
}
