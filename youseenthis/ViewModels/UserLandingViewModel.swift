//
//  UserLandingViewModel.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/27/22.
//

import Foundation
import SwiftUI

class UserLandingViewModel {
    @ObservedObject var userData: UserData
    
    init(userData: UserData) {
        self.userData = userData
    }
}
