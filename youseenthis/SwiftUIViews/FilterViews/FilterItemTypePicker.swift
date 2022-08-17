//
//  FilterItemTypePicker.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/17/22.
//

import SwiftUI

struct FilterItemTypePicker: View {
    @Binding var filterItemType: FilterItemType
    var body: some View {
        Picker("Type:", selection: $filterItemType) {
            ForEach (FilterItemType.allCases) { type in
                HStack {
                    FilterItemTypeImage(filterItemType: type)
                    Text(type.filterStringValue())
                }.tag(type)
            }
        }
    }
}

struct FilterItemTypePicker_Previews: PreviewProvider {
    static var previews: some View {
        FilterItemTypePicker(filterItemType: .constant(.noFilter))
    }
}
