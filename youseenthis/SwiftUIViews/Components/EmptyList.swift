//
//  EmptyList.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/12/22.
//

import SwiftUI

struct EmptyList: View {
    var body: some View {
        Text(ViewStrings.emptyList)
            .font(.title)
    }
}

struct EmptyList_Previews: PreviewProvider {
    static var previews: some View {
        EmptyList()
    }
}
