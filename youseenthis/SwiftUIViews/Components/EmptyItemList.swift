//
//  EmptyItemList.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/14/22.
//

import SwiftUI

struct EmptyItemList: View {
    var body: some View {
        Text(ViewStrings.emptyItemList)
            .font(.title)
    }
}

struct EmptyItemList_Previews: PreviewProvider {
    static var previews: some View {
        EmptyItemList()
    }
}
