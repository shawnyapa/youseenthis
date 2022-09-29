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
    
    static func importUserData(from url: URL) -> String? {
        /// url String format == youseenthis://adduserdatatopeople/[UserData] in JSON Format
        let string = url.absoluteString
        let components = string.components(separatedBy: Constants.addUser)
        guard let userDataString = components.last,
              let urlDecoded = userDataString.removingPercentEncoding,
              let userData = UserData(jsonString: urlDecoded) else {
            return nil
        }
        let username = userData.user.username
        let message = "Adding \(username) UserData to People"
        ImportUtility.addUserDataToFollow(userData: userData)
        
        return message
    }
    
    static func addUserDataToFollow(userData: UserData) {
        let modelService = ServiceFactory.makeServices()
        guard let loggedInUser = modelService.loggedInUser() else {
            return
        }
        let followUser = userData.user
        let followItems = userData.items
        modelService.saveUser(user: followUser)
        for item in followItems {
            modelService.saveItem(item: item)
        }
        modelService.requestToFollow(primaryUserId: loggedInUser.username, followUserId: followUser.username)
        modelService.respondToFollowRequest(followId: followUser.username, approve: true)
    }
    
    static func removeUserDataFromFollow(with userId: String) {
        let modelService = ServiceFactory.makeServices()
        modelService.removeUserById(username: userId)
        let items = modelService.findItemsForUser(userId: userId)
        for item in items {
            modelService.removeItemById(itemId: item.id)
        }
        modelService.removeRequestToFollow(followId: userId)
    }
}
