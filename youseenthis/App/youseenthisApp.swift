//
//  youseenthisApp.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/20/22.
//

import SwiftUI

@main
struct youseenthisApp: App {
    
    let labTesting: Bool = false
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @ObservedObject var userData = Coordinator.shared.userData
    var body: some Scene {
        WindowGroup {
            if labTesting {
                LabTesting(user: $userData.user)
            } else {
                let viewModel = UserLandingViewModel(userData: userData)
                UserLandingView(user: $userData.user, items: viewModel.$userData.items)
            }
            
        }
    }
}

/* ***SY TODO: List
 
 Implement Git/Github (Done)
 
 Fix "You Got Nothing Bug" (Done)
 Update Filter Overlay Color to match bottomBar (Done)
 Add Tabbar and TabItems -> Items, People (Done)
 Refactor Navigation for Profile and People Management
 Create User Management, just UserName for now
 
 Remove Sort Icon
 
 Add versioning tag to JSON Format
 Create mechanism to export/import json to file
 
 Add Rating
 Add Notes
 Add Date Created
 Add Tags

 Update to Purple Logo
 Update missing Logo Asset Sizes
 Setup LocalizedStrings and Files
 Update Name to Danky
 Copy over to AppBundle Danky
 
 Refactor Persistence
 Integrate Network API
 
 Distribution on TestFlight
 
 Add Search to Toolbar
 Add Sort to Toolbar
 
 */
