//
//  ItemListViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/27/22.
//

import Foundation
import SwiftUI

class ItemListViewModel {
    var canEdit: Bool
    var userData: UserData
    
    init(canEdit: Bool = false, userData: UserData) {
        self.canEdit = canEdit
        self.userData = userData
    }
}
