//
//  ItemTitleField.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/26/22.
//

import SwiftUI

struct ItemTitleField: View {
    var item: Item
    var body: some View {
        VStack {
            Divider()
            HStack {
                VStack(alignment: .leading) {
                    Text("\(ViewStrings.title):")
                        .font(.headline)
                    Text(item.title)
                        .font(.title)
                }
                Spacer()
            }
        }
    }
}

struct ItemTitleField_Previews: PreviewProvider {
    static var previews: some View {
        let item = ExampleData.createItem()
        ItemTitleField(item: item)
    }
}
