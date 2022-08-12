//
//  DeleteButton.swift
//  youseenthis
//
//  Created by Shawn Yapa on 4/24/22.
//

import SwiftUI

struct DeleteButton: View {
    @Environment(\.presentationMode) var presentationMode
    var item: Item
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                Coordinator.shared.removeItem(item: item)
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: SystemImage.delete.rawValue)
            }
            Spacer()
        }
    }
}

struct DeleteButton_Previews: PreviewProvider {
    static var previews: some View {
        DeleteButton(item: Item.defaultValue())
    }
}
