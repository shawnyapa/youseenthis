//
//  PeopleListHeader.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/14/22.
//

import SwiftUI

struct PeopleListHeader: View {
    var body: some View {
        HStack {
            Text(ViewStrings.people)
            Spacer()
            Button(action: {}, label: {Image(systemName: SystemImage.create.rawValue)})
        }
    }
}

struct PeopleListHeader_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListHeader()
    }
}
