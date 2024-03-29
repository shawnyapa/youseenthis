//
//  EditItemView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/20/22.
//

import SwiftUI

struct EditItemView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var editItemVM: EditItemViewModel
    var body: some View {
        Form {
            Section(header: Text(ViewStrings.title)) {
                TextField("\(ViewStrings.title)", text:$editItemVM.item.title)
            }
            Section(header: Text(ViewStrings.type)) {
                ItemTypePicker(itemType: $editItemVM.item.itemType)
            }
            Section(header: Text(ViewStrings.status)) {
                ItemStatusPicker(itemStatus: $editItemVM.item.itemStatus)
            }
            Section(header: Text(ViewStrings.rating)) {
                ItemRatingPicker(itemRating: $editItemVM.item.rating)
            }
            TagsEditor(tags: $editItemVM.item.tags)
            Section(header: Text(ViewStrings.notes)) {
                TextEditor(text: $editItemVM.item.notes)
                    .frame(height: 150, alignment: .top)
            }
            HStack {
                Spacer()
                Button(ViewStrings.delete, role: .destructive) {
                    editItemVM.removeItem()
                    dismiss()
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(editItemVM.isUpdating ? true:false)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                if editItemVM.isUpdating {
                    Button(action: {
                        editItemVM.editItem()
                        dismiss()
                    }, label: {
                        Text(ViewStrings.update)
                            .foregroundColor(SystemColors.dankyAccentColor)
                    })
                    .buttonStyle(.borderedProminent)
                } else {
                    Button(action: {
                        editItemVM.editItem()
                        dismiss()
                    }, label: {
                        Text(ViewStrings.update)
                            .foregroundColor(Color.white)
                    })
                    .buttonStyle(.automatic)
                }
            }
        }
        .onChange(of: editItemVM.item) { newValue in
            editItemVM.onChangeOfForm()
        }
    }
}

struct EditItemView_Previews: PreviewProvider {
    static var previews: some View {
        let item = Item.defaultValue()
        let mockItemService = MockManager.shared
        EditItemView(editItemVM: EditItemViewModel(itemService: mockItemService, item: item))
    }
}
