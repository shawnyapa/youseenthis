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
                UserLandingView(items: viewModel.$userData.items)
            }
            
        }
    }
}

/* ***SY ToDo List

 Create User Management, just UserName for now
 
 Fix "You Got Nothing Bug"
 
 Add versioning tag to JSON Format
 Create mechanism to export/import json to file
 
 Add Rating
 Add Notes
 Add Date Created

 Update to Purple Logo
 Update missing Logo Asset Sizes
 Setup LocalizedStrings and Files
 Update Name to Danky
 Copy over to AppBundle Danky
 
 Implement Git/Github
 Distribution on TestFlight
 
 Add Search to Toolbar
 Add Sort to Toolbar
 Add Tags
 
 */
