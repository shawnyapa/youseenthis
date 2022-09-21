//
//  CreateItemView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/19/22.
//

import SwiftUI

struct CreateItemView: View {
    
    @Binding var showCreateItem: Bool
    @ObservedObject var createItemVM: CreateItemViewModel
    
    var body: some View {
        VStack {
            HStack {
                Button(ViewStrings.cancel) {
                    showCreateItem.toggle()
                }
                .buttonStyle(BorderlessButtonStyle())
                Spacer()
                Button(ViewStrings.add) {
                    createItemVM.addItem()
                    showCreateItem.toggle()
                }
                .buttonStyle(BorderlessButtonStyle())
            }
            .padding()
            Form {

                Section(header: Text(ViewStrings.title)) {
                    TextField("\(ViewStrings.title)", text:$createItemVM.item.title)
                }
                Section(header: Text(ViewStrings.type)) {
                    ItemTypePicker(itemType: $createItemVM.item.itemType)
                }
                Section(header: Text(ViewStrings.status)) {
                    ItemStatusPicker(itemStatus: $createItemVM.item.itemStatus)
                }
                Section(header: Text(ViewStrings.type)) {
                    ItemRatingPicker(itemRating: $createItemVM.item.rating)
                }
                TagsEditor(tags: $createItemVM.item.tags)
                Section(header: Text(ViewStrings.notes)) {
                    TextEditor(text: $createItemVM.item.notes)
                        .frame(height: 150, alignment: .top)
                }
            }
        }
    }
}

struct CreateItemView_Previews: PreviewProvider {
    static var previews: some View {
        CreateItemView(showCreateItem: .constant(true), createItemVM: CreateItemViewModel(item: Item.defaultValue()))
    }
}
