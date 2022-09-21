//
//  ItemRatingImage.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/16/22.
//

import SwiftUI

struct ItemRatingImage: View {
    var itemRating: ItemRating
    var body: some View {
        if let imageString = itemRating.imageString() {
            Image(imageString)
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .cornerRadius(5)
        } else {
            Image(systemName: SystemImage.minus.rawValue)
                .frame(width: 30, height: 30, alignment: .center)
        }
    }
}

struct ItemRatingImage_Previews: PreviewProvider {
    static var previews: some View {
        ItemRatingImage(itemRating: .janky)
    }
}
