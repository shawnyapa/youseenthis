//
//  ItemTypeImage.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/6/22.
//

import SwiftUI

struct ItemTypeImage: View {
    var itemType: ItemType
    var body: some View {
        switch itemType {
        case .notSelected:
            Image(systemName: SystemImage.notSelected.rawValue)
        case .movie:
            Image(systemName: SystemImage.movie.rawValue)
        case .tvShow:
            Image(systemName: SystemImage.tvShow.rawValue)
        case .videoGame:
            Image(systemName: SystemImage.videoGame.rawValue)
        }
    }
}

struct ItemTypeImage_Previews: PreviewProvider {
    static var previews: some View {
        let itemType = ItemType.tvShow
        ItemTypeImage(itemType: itemType)
    }
}
