//
//  ImportUtility.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/12/22.
//

import Foundation

struct ImportUtility {
    
    private struct Constants {
        static let addUser = "adduserdatatopeople/"
    }
    
    static func importUserData(from url: URL) {
        /// url String format == youseenthis://adduserdatatopeople/[UserData] in JSON Format
        let string = url.absoluteString
        let components = string.components(separatedBy: Constants.addUser)
        guard let userDataString = components.last,
              let urlDecoded = userDataString.removingPercentEncoding,
              let userData = UserData(jsonString: urlDecoded) else {
            return
        }
        let username = userData.user.username
        print("Adding \(username) UserData to People")
        // TODO: Implement Pop-Up Import Confirmation with Yes/No
        Coordinator.shared.addUserDataToPeople(userData: userData)
    }
}
