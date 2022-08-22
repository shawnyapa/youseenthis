//
//  LabTesting.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/22/22.
//

import Foundation

struct LabTesting {
    
    /// Testing for JSON String transforming for Peer to Peer Sharing
    static func jsonTesting(userData: UserData) {
        if let userDataString = userData.jsonString() {
            print("UserData String")
            print(userDataString)
            if let userData = UserData(jsonString: userDataString) {
                print("UserData Object")
                print(userData)
            }
        }
    }
}
