//
//  SortAndFilterRow.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/17/22.
//

import SwiftUI

struct SortAndFilterRow: View {
    @Binding var filterItemType: FilterItemType
    var body: some View {
        HStack {
            Text(ViewStrings.sort)
            Divider()
            Text(ViewStrings.filter)
            FilterItemTypePicker(filterItemType: $filterItemType)
        }
    }
}

struct SortAndFilterRow_Previews: PreviewProvider {
    static var previews: some View {
        SortAndFilterRow(filterItemType: .constant(.noFilter))
    }
}
