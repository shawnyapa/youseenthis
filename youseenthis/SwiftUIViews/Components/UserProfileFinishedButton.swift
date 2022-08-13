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
    @Environment(\.presentationMode) var presentationMode
    var mode: Mode
    var user: User
    var body: some View {
        Button(action: {
            switch mode {
                case .create:
                    let _ = Coordinator.shared.addUser(user: user)
                case .edit:
                    let _ = Coordinator.shared.editUser(user: user)
            }
            presentationMode.wrappedValue.dismiss()
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
