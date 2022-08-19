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
    @ObservedObject var userData = Coordinator.shared.primaryUserData
    @ObservedObject var itemData = Coordinator.shared.itemData
    var body: some Scene {
        WindowGroup {
            if labTesting {
                LabTesting(user: $userData.user)
            } else {
                // TODO: Refactor ViewModels
                //let viewModel = UserLandingViewModel(userData: userData)
                //UserLandingView(primaryUser: $userData.user, people: $userData.people, items: viewModel.$userData.items)
                UserLandingView(primaryUser: $userData.user, people: $userData.people, items: $itemData.items)
            }
            
        }
    }
}

/* ***SY TODO: List
 
 Implement Git/Github (Done)
 
 Add versioning tag to JSON Format (Done)
 Fix "You Got Nothing Bug" (Done)
 Update Filter Overlay Color to match bottomBar (Done)
 Add Tabbar and TabItems -> Items, People (Done)
 Refactor Navigation for Profile and People Management (Done)
 Create User Management (Done)
 Show Items for Selected People->UserData->Items (Done)
 
 Remove Sort Icon
 
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
