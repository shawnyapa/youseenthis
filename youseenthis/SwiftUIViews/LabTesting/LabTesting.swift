//
//  LabTesting.swift
//  youseenthis
//
//  Created by Shawn Yapa on 4/24/22.
//

import SwiftUI

struct LabTesting: View {
    @Binding var user: User
    var body: some View {
        let canEdit = true
        UserProfileView(canEdit: canEdit, mode: .view, user: $user)
    }
}

struct LabTesting_Previews: PreviewProvider {
    static var previews: some View {
        LabTesting(user: .constant(User.sampleValue()))
    }
}
