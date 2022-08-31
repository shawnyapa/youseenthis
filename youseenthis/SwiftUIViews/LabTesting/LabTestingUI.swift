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
        let tags = ["SciFi", "StarWars", "Detective1", "Detective2", "ExtraTag", "OneMoreToWrap"]
        TagsEditor(tags: tags)
    }
}

struct LabTesting_Previews: PreviewProvider {
    static var previews: some View {
        let userData = ExampleData.createUserDataWithItems()
        LabTestingUI(user: userData)
    }
}
