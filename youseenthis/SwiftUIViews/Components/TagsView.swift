//
//  TagsView.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/29/22.
//

import SwiftUI
import WrappingStack

struct TagsView: View {
    var tags: [String]
    var body: some View {
        WrappingHStack(id: \.self) {
            ForEach(tags, id: \.self) { tag in
                Text(tag)
                    .padding(5)
                    .background(SystemColors.activeTagFill)
                    .clipShape(Capsule())
                    .font(.body)
                    .foregroundColor(Color(UIColor.systemBackground))
            }
        }
    }
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        let tags = ["SciFi", "StarWars", "Detective", "Detective", "ExtraTag", "OneMoreTag"]
        TagsView(tags: tags)
    }
}
