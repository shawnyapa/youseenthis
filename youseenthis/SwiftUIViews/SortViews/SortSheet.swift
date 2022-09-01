//
//  SortSheet.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/31/22.
//

import SwiftUI

struct SortSheet: View {
    @Binding var itemSortType: ItemSortType
    var body: some View {
        VStack {
            Text(ViewStrings.sort)
            Divider()
            HStack {
                ItemSortTypePicker(itemSortType: $itemSortType)
            }
            Divider()
        }
        .padding()
        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(UIColor.systemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
    }
}

struct SortSheet_Previews: PreviewProvider {
    static var previews: some View {
        SortSheet(itemSortType: .constant(.titleAscending))
    }
}
