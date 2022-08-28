//
//  UserProfileFinishedButton.swift
//  youseenthis
//
//  Created by Shawn Yapa on 4/30/22.
//

import SwiftUI

struct UserProfileFinishedButton: View {
    enum Mode {
        case create
        case edit
    }
    @Environment(\.dismiss) private var dismiss
    var mode: Mode
    var user: User
    var body: some View {
        Button(action: {
            switch mode {
                case .create:
                    let _ = Coordinator.shared.addPrimaryUser(user: user)
                case .edit:
                    let _ = Coordinator.shared.editPrimaryUser(user: user)
            }
            dismiss()
        }) {
            Image(systemName: SystemImage.done.rawValue)
        }
    }
}

struct UserProfileFinishedButton_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileFinishedButton(mode: .create, user: User.newBlankUser())
    }
}
