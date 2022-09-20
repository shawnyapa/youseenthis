//
//  CreateItemView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/19/22.
//

import SwiftUI

struct CreateItemView: View {
    @Binding var showCreateItem: Bool
    @ObservedObject var createItemVM = CreateItemViewModel()
    @State private var itemTitle = ""
    @State private var itemType = ItemType.notSelected
    @State private var itemStatus = ItemStatus.willWatch
    @State private var itemRating = ItemRating.notRated
    @State private var tags = [String]()
    @State private var notes = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(ViewStrings.cancel) {
                    showCreateItem.toggle()
                }
                .buttonStyle(BorderlessButtonStyle())
                Spacer()
                Button(ViewStrings.add) {
                    if !itemTitle.isEmpty {
                        createItemVM.addItem(title: itemTitle,
                                             itemType: itemType,
                                             itemStatus: itemStatus,
                                             itemRating: itemRating,
                                             tags: tags,
                                             notes: notes)
                    }
                    showCreateItem.toggle()
                }
                .buttonStyle(BorderlessButtonStyle())
            }
            .padding()
            Form {

                Section(header: Text(ViewStrings.title)) {
                    TextField("\(ViewStrings.title)", text:$itemTitle)
                }
                Section(header: Text(ViewStrings.type)) {
                    ItemTypePicker(itemType: $itemType)
                }
                Section(header: Text(ViewStrings.status)) {
                    ItemStatusPicker(itemStatus: $itemStatus)
                }
                Section(header: Text(ViewStrings.type)) {
                    ItemRatingPicker(itemRating: $itemRating)
                }
                TagsEditor(tags: $tags)
                Section(header: Text(ViewStrings.notes)) {
                    TextEditor(text: $notes)
                        .frame(height: 150, alignment: .top)
                }
            }
        }
    }
}

struct CreateItemView_Previews: PreviewProvider {
    static var previews: some View {
        CreateItemView(showCreateItem: .constant(true))
    }
}
