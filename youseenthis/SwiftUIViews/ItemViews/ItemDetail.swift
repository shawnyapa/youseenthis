//
//  ItemDetail.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/21/22.
//

import SwiftUI

struct ItemDetail: View {
    enum Mode: String {
        case create
        case edit
        case view
    }
    var canEdit: Bool = false
    @State var mode: Mode
    @State var item: Item
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text("\(ViewStrings.title):")
                        .font(.headline)
                    if mode == .view {
                        Text(item.title)
                            .font(.title)
                    } else if mode == .edit || mode == .create {
                        TextField("\(ViewStrings.title)", text:$item.title)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                }
                Spacer()
            }
            Divider()
            HStack {
                Text("\(ViewStrings.type):")
                    .font(.headline)
                if mode == .view {
                    ItemTypeImage(itemType: item.itemType)
                    Text(item.itemType.stringValue())
                        .font(.subheadline)
                } else if mode == .edit || mode == .create {
                    ItemTypePicker(item: $item)
                }
                Spacer()
            }
            Divider()
            HStack {
                Text("\(ViewStrings.status):")
                    .font(.headline)
                if mode == .view {
                    ItemStatusImage(itemStatus: item.itemStatus)
                    Text(item.itemStatus.stringValue())
                        .font(.subheadline)
                } else if mode == .edit || mode == .create {
                    ItemStatusPicker(item: $item)
                }
                Spacer()
            }
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
