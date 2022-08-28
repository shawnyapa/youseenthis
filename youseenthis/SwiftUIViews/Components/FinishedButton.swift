//
//  FinishedButton.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/13/22.
//

import SwiftUI

struct FinishedButton: View {
    enum Mode {
        case create
        case edit
    }
    @Environment(\.dismiss) private var dismiss
    var mode: Mode
    var item: Item
    var body: some View {
        Button(action: {
            switch mode {
                case .create:
                    Coordinator.shared.addItem(item: item)
                case .edit:
                    Coordinator.shared.editItem(item: item)
            }
            dismiss()
        }) {
            Image(systemName: SystemImage.done.rawValue)
        }
    }
}

struct FinishedButton_Previews: PreviewProvider {
    static var previews: some View {
        FinishedButton(mode: FinishedButton.Mode.create, item: Item.defaultValue())
    }
}
