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
    @State private var showingAlert = false
    @State private var importUserMessage: String = ""
    var body: some Scene {
        WindowGroup {
            if labTestingUI {
                LabTestingUI()
            } else {
                RootView(rootVM: RootViewModel())
                    .onOpenURL { url in
                        if let message = ImportUtility.importUserData(from: url) {
                            importUserMessage = message
                            showingAlert = true
                        }
                    }
                    .alert(importUserMessage, isPresented: $showingAlert) {
                        Button("OK", role: .cancel) {
                            importUserMessage = ""
                            showingAlert = false
                        }
                    }
            }
            
        }
    }
}

/*  TODO: List
 
 Implement Git/Github (Done)
 
 Add versioning tag to JSON Format (Done)
 Fix "You Got Nothing Bug" (Done)
 Update Filter Overlay Color to match bottomBar (Done)
 Add Tabbar and TabItems -> Items, People (Done)
 Refactor Navigation for Profile and People Management (Done)
 Create User Management (Done)
 Show Items for Selected People->UserData->Items (Done)
 Peer-to-Peer Sharing
    Create mechanism to export/import json from String (Done)
    Add URL Scheme (Done)
    Add AppDelegate URL Parser - Testing - xcrun simctl openurl booted "youseenthis://test" (Done)
    Persistence Layer - Add/Delete UserData for userData.people = [UserData] (Done)
    Implement Delete Button for PeopleList (Done)
    Add & Configure ShareSheet (Done)
 Add Rating to Item (Done)
 Add Notes to Item (Done)
 Add Tags to Item (Done)
 Add AboutMe to User (Done)
 Add PhoneNumber to User (Done)
 Add Sort to Toolbar (Alphabetical vs Rating) (Done)
 Add Notes to UX (Done)
 Add About Me to UX (Done)
 Create Tags UX (Done)
    TagsView -> Use Capsule() (Done)
    TagsEditor (Done)
    TagsSelector (Done)
 Integrate Tags UX into existing UX (Done)
 Update Ratings with 5 Images, Logo->GreenFace (Done)
 Fix ViewModels (Done)
 Refactor with Forms (Done)
 Separate View/Edit (Done)
 Remove Confirm Button from Edit, Save on Back
 
 Refactor with UserService and ItemService Protocol (Done)
 Refactor UserService & Add LogInService (Done)
 Add RootView with Login/Logout State
 Add Follow Model & FollowService (Done)
 Refactor Import/Export Utility (Done)

 Update to Purple Logo
 Update missing Logo Asset Sizes
 Setup LocalizedStrings and Files
 Update Name to Danky
 Copy over to AppBundle Danky
 
 
 Refactor Persistence (Use AWS Amplify)
 Integrate Network API (Use AWS Amplify)
 
 Distribution on TestFlight
 
 Add Search to Toolbar
 
 */
