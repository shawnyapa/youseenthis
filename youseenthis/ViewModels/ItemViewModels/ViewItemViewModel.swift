//
//  ViewItemVM.swift
//  youseenthis
//
//  Created by Shawn Yapa on 9/18/22.
//

import Foundation

class ViewItemViewModel: ObservableObject {
    
    var item: Item
    
    init(item: Item) {
        self.item = item
    }
}
