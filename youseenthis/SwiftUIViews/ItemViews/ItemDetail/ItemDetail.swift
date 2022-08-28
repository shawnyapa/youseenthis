//
//  ItemDetail.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/21/22.
//

import SwiftUI

enum ItemEditMode: String {
    case create
    case edit
    case view
}

struct ItemDetail: View {
    var canEdit: Bool = false
    @State var mode: ItemEditMode   // TODO: Fix this @State property wrapper
    @State var item: Item   // TODO: Fix this @State property wrapper
    // TODO: Refactor with .dismiss
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Spacer()
            ItemTitleField(mode: $mode, item: $item)
            ItemTypeField(mode: $mode, item: $item)
            ItemStatusField(mode: $mode, item: $item)
            ItemRatingField(mode: $mode, item: $item)
            ItemNotesField(mode: $mode, item: $item)
            Spacer()
            if mode == .view, canEdit == true {
                DeleteButton(item: item)
            }
        }
        .padding(.all)
        .navigationTitle(item.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if mode == .view, canEdit == true {
                    Button(action: { mode = .edit }) {
                        Image(systemName: SystemImage.edit.rawValue)
                    }
                } else if mode == .edit {
                    FinishedButton(mode: FinishedButton.Mode.edit, item: item)
                } else if mode == .create {
                    FinishedButton(mode: FinishedButton.Mode.create, item: item)
                } else {
                    AnyView(EmptyView())
                }
            }
        }
    }
}


struct ItemDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        let userData = ExampleData.createUserDataWithItems()
        let item1 = userData.items[0]
        ItemDetail(canEdit: true, mode: .view, item: item1)
    }
}
