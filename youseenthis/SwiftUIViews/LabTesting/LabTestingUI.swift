//
//  LabTesting.swift
//  youseenthis
//
//  Created by Shawn Yapa on 4/24/22.
//

import SwiftUI

struct LabTestingUI: View {
    var user: UserData
    var body: some View {
        
        EmptyView()
    }
}

struct LabTesting_Previews: PreviewProvider {
    static var previews: some View {
        let userData = ExampleData.createUserDataWithItems()
        LabTestingUI(user: userData)
    }
}
