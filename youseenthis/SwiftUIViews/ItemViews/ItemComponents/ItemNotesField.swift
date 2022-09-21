//
//  ItemNotesField.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/26/22.
//

import SwiftUI

struct ItemNotesField: View {
    var item: Item
    var body: some View {
        VStack {
            Divider()
            HStack {
                VStack(alignment: .leading) {
                    Text("\(ViewStrings.notes):")
                        .font(.headline)
                    Text(item.notes)
                        .font(.body)
                        .frame(height: 160)
                        .cornerRadius(16)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
            }
            .border(Color.clear)
            .padding([.top, .bottom])
            Divider()
        }
    }
}

struct ItemNotesField_Previews: PreviewProvider {
    static var previews: some View {
        let userData = ExampleData.createUserDataWithItems()
        let item1 = userData.items[0]
        ItemNotesField(item: item1)
    }
}
