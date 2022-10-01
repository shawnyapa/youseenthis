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
        NavigationStack {
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
            .navigationTitle(ViewStrings.createNew)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(SystemColors.dankyAccentColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                            createItemVM.addItem()
                            showCreateItem.toggle()
                    }, label: {
                        Text(ViewStrings.add)
                    })
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                            showCreateItem.toggle()
                    }, label: {
                        Text(ViewStrings.cancel)
                    })
                }
            }
        }
    }
}

struct CreateItemView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleUser = User.sampleValue()
        let mockServices = MockManager.shared
        let createItemVM = CreateItemViewModel(modelService: mockServices,
                                               item: Item.defaultValue(),
                                               loggedInUser: exampleUser)
        CreateItemView(showCreateItem: .constant(true), createItemVM: createItemVM)
    }
}
