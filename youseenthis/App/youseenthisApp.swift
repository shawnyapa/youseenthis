//
//  youseenthisApp.swift
//  youseenthis
//
//  Created by Shawn Yapa on 2/20/22.
//

import SwiftUI

@main
struct youseenthisApp: App {
    
    let labTestingUI: Bool = false
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @ObservedObject var primaryUserData = Coordinator.shared.primaryUserData
    @ObservedObject var viewedUserData = Coordinator.shared.viewedUserData
    @ObservedObject var itemData = Coordinator.shared.itemData
    var body: some Scene {
        WindowGroup {
            if labTestingUI {
                LabTestingUI(user: primaryUserData)
            } else {
                // TODO: Refactor ViewModels, currently a total unuseable mess
                //let viewModel = UserLandingViewModel(userData: userData)
                //UserLandingView(primaryUser: $userData.user, people: $userData.people, items: viewModel.$userData.items)
                UserLandingView(primaryUser: $primaryUserData.user, viewedUser: $viewedUserData.user, people: $primaryUserData.people, items: $itemData.items)
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
 Add Tags
 Add Date Created

 Update to Purple Logo
 Update missing Logo Asset Sizes
 Setup LocalizedStrings and Files
 Update Name to Danky
 Copy over to AppBundle Danky
 
 Refactor Persistence (Use AWS Amplify)
 Integrate Network API (Use AWS Amplify)
 
 Distribution on TestFlight
 
 Add Search to Toolbar
 Add Sort to Toolbar (Alphabetical vs Rating)
 
 */
