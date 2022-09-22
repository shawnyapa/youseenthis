//
//  ItemTagsField.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/31/22.
//

import SwiftUI

struct ItemTagsField: View {
    var item: Item
    var body: some View {
        VStack {
            Divider()
                if !item.tags.isEmpty {
                    TagsView(tags: item.tags)
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
        let item = ExampleData.createItem()
        ItemTagsField(item: item)
    }
}
