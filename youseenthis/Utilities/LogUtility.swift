//
//  LogUtility.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/12/22.
//

import Foundation

struct LogUtility {
    
    static func logItems(items: [String:Item]) {
        let arrayForLogging: [[String:Any]] = items.map {
            $0.value.rawDictionaryForLogging()
        }
        print("UserItems: \(arrayForLogging)")
    }
}
