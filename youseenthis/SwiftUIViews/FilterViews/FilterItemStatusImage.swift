//
//  FilterItemStatusImage.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/19/22.
//

import SwiftUI

struct FilterItemStatusImage: View {
    var filterItemStatus: FilterItemStatus
    var body: some View {
        switch filterItemStatus {
        case .noFilter:
            return Image(systemName: SystemImage.no_Filter_Sort_Selection.rawValue)
        case .notSelected:
            return Image(systemName: SystemImage.notSelected.rawValue)
        case .willWatch:
            return Image(systemName: SystemImage.willWatch.rawValue)
        case .watching:
            return Image(systemName: SystemImage.watching.rawValue)
        case .didWatch:
            return Image(systemName: SystemImage.didWatch.rawValue)
        case .wontWatch:
            return Image(systemName: SystemImage.wontWatch.rawValue)
        }
    }
}

struct FilterItemStatusImage_Previews: PreviewProvider {
    static var previews: some View {
        FilterItemStatusImage(filterItemStatus: .noFilter)
    }
}
