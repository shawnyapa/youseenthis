//
//  EmptyPeopleList.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/14/22.
//

import SwiftUI

struct EmptyPeopleList: View {
    var body: some View {
        Text(ViewStrings.emptyPeopleList)
            .font(.title)
    }
}

struct EmptyPeopleList_Previews: PreviewProvider {
    static var previews: some View {
        EmptyPeopleList()
    }
}
