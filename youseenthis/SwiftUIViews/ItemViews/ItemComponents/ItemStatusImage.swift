//
//  ItemStatusImage.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/6/22.
//

import SwiftUI

struct ItemStatusImage: View {
    var itemStatus: ItemStatus
    var body: some View {
        switch itemStatus {
        case .notSelected:
            Image(systemName: SystemImage.notSelected.rawValue)
        case .willWatch:
            Image(systemName: SystemImage.willWatch.rawValue)
        case .watching:
            Image(systemName: SystemImage.watching.rawValue)
        case .didWatch:
            Image(systemName: SystemImage.didWatch.rawValue)
        case .wontWatch:
            Image(systemName: SystemImage.wontWatch.rawValue)
        }
    }
}

struct ItemStatusImage_Previews: PreviewProvider {
    static var previews: some View {
        let status = ItemStatus.watching
        ItemStatusImage(itemStatus: status)
    }
}
