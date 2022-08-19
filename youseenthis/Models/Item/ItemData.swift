//
//  ItemData.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/18/22.
//

import Foundation

class ItemData: ObservableObject {
    @Published var items:[Item]

    init(items: [Item]?) {
        self.items = items ?? [Item]()
    }
}
