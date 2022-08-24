//
//  ExportUtility.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/12/22.
//

import Foundation

struct ExportUtility {
    
    static func exportUserDataWithUrl(userData: UserData) -> URL {
        /// youseenthis://adduserdatatopeople/
        let urlSchemeString = "youseenthis:///adduserdatatopeople/"
        let userDataString = userData.jsonString() ?? ""
        let urlEncodedJSON = userDataString.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        let urlString = urlSchemeString + urlEncodedJSON
        guard let url = URL(string: urlString) else {
            return URL(string: urlSchemeString)!
        }
        return url
    }
}
