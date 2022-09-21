//
//  ItemStatusPicker.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/12/22.
//

import SwiftUI

struct ItemStatusPicker: View {
    @Binding var itemStatus: ItemStatus
    var body: some View {
        Picker("\(ViewStrings.status):", selection: $itemStatus) {
            ForEach (ItemStatus.allCases) { status in
                HStack {
                    Text(status.stringValue())
                    ItemStatusImage(itemStatus: status)
                }.tag(status)
            }
        }
    }
}

struct ItemStatusPicker_Previews: PreviewProvider {
    static var previews: some View {
        ItemStatusPicker(itemStatus: .constant(.watching))
    }
}
