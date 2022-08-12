//
//  FilterItemStatusPicker.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/19/22.
//

import SwiftUI

struct FilterItemStatusPicker: View {
    @Binding var filterItemStatus: FilterItemStatus
    var body: some View {
        Picker("Status:", selection: $filterItemStatus) {
            ForEach (FilterItemStatus.allCases) { status in
                HStack {
                    FilterItemStatusImage(filterItemStatus: status)
                    Text(status.stringValue())
                }.tag(status)
            }
        }
    }
}

struct FilterItemStatusPicker_Previews: PreviewProvider {
    static var previews: some View {
        FilterItemStatusPicker(filterItemStatus: .constant(.noFilter))
    }
}
