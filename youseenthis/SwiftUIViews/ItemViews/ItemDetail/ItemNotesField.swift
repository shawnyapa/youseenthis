//
//  ItemNotesField.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/26/22.
//

import SwiftUI

struct ItemNotesField: View {
    @Binding var mode: ItemEditMode
    @Binding var item: Item
    var body: some View {
        VStack {
            Divider()
            HStack {
                VStack(alignment: .leading) {
                    Text("\(ViewStrings.notes):")
                        .font(.headline)
                    if mode == .view {
                        Text(item.notes)
                            .font(.title)
                            .frame(height: 160)
                            .cornerRadius(16)
                            .multilineTextAlignment(.leading)
                    } else if mode == .edit || mode == .create {
                        TextField("\(ViewStrings.notes)", text:$item.notes)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .frame(height: 150)
                            .cornerRadius(16)
                            .multilineTextAlignment(.leading)
                    }
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
        ItemNotesField(mode: .constant(ItemEditMode.view), item: .constant(item1))
    }
}
