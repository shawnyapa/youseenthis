//
//  String+Cleaner.swift
//  youseenthis
//
//  Created by Shawn Yapa on 8/31/22.
//

import Foundation

extension String {

    func removeSpecialCharactersAndBlankSpaces() -> String {
        let okayChars = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890")
        return String(self.unicodeScalars.filter { okayChars.contains($0) || $0.properties.isEmoji })
    }
}
