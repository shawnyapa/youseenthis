//
//  ItemDetail.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/21/22.
//

import SwiftUI

struct ViewItemView: View {
    var item: Item
    var body: some View {
        VStack {
            Spacer()
            ItemTitleField(item: item)
            ItemTypeField(item: item)
            ItemStatusField(item: item)
            ItemRatingField(item: item)
            ItemTagsField(item: item)
            ItemNotesField(item: item)
            Spacer()
        }
        .padding(.all)
        .navigationTitle(item.title)
    }
}


struct ViewItemView_Previews: PreviewProvider {
    static var previews: some View {
        let item = ExampleData.createItem()
        ViewItemView(item: item)
    }
}
