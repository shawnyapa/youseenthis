//
//  DeletePersonButton.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/24/22.
//

import SwiftUI

struct DeletePersonButton: View {
    let userId: String
    var body: some View {
        Button(action: {
            Coordinator.shared.removeUserDataFromPeople(with: userId)
        }) {
            Image(systemName: SystemImage.delete.rawValue)
        }
    }
}

struct DeletePersonButton_Previews: PreviewProvider {
    static var previews: some View {
        DeletePersonButton(userId: "XYZ123")
    }
}
