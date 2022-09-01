//
//  FilterSheet.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/31/22.
//

import SwiftUI

struct FilterSheet: View {
    @Binding var filterItemType: FilterItemType
    @Binding var filterItemStatus: FilterItemStatus
    @Binding var selectedTags: [String]
    var existingTags: [String]
    var body: some View {
        VStack {
            Text(ViewStrings.filter)
            Divider()
            HStack {
                Text("\(ViewStrings.type):")
                FilterItemTypePicker(filterItemType: $filterItemType)
            }
            Divider()
            HStack {
                Text("\(ViewStrings.status):")
                FilterItemStatusPicker(filterItemStatus: $filterItemStatus)
            }
            Divider()
            TagsSelector(existingTags: existingTags, selectedTags: $selectedTags)
            Divider()
        }
        .padding()
        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(UIColor.systemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
    }
}

struct FilterSheet_Previews: PreviewProvider {
    static var previews: some View {
        FilterSheet(filterItemType: .constant(.movie), filterItemStatus: .constant(.willWatch), selectedTags: .constant([String]()), existingTags: [String]())
    }
}
