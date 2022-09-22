//
//  ItemSortTypePicker.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/25/22.
//

import SwiftUI

struct ItemSortTypePicker: View {
    @Binding var itemSortType: ItemSortType
    var body: some View {
        Picker("\(ViewStrings.sort):", selection: $itemSortType) {
            ForEach (ItemSortType.allCases) { sortType in
                HStack {
                    Text(sortType.stringForPickerTextForSortType())
                    Image(systemName: sortType.stringForPickerImageForSortType())
                }.tag(sortType)
            }
        }
    }
}

struct ItemSortTypePicker_Previews: PreviewProvider {
    static var previews: some View {
        ItemSortTypePicker(itemSortType: .constant(.titleAscending))
    }
}
