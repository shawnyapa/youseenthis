//
//  FilterItemTypeImage.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/17/22.
//

import SwiftUI

struct FilterItemTypeImage: View {
    var filterItemType: FilterItemType
    var body: some View {
        switch filterItemType {
        case .noFilter:
            Image(systemName: SystemImage.no_Filter_Sort_Selection.rawValue)
        case .notSelected:
            Image(systemName: SystemImage.notSelected.rawValue)
        case .videoGame:
            Image(systemName: SystemImage.videoGame.rawValue)
        case .movie:
            Image(systemName: SystemImage.movie.rawValue)
        case .tvShow:
            Image(systemName: SystemImage.tvShow.rawValue)
        }
    }
}

struct FilterItemTypeImage_Previews: PreviewProvider {
    static var previews: some View {
        FilterItemTypeImage(filterItemType: .noFilter)
    }
}
