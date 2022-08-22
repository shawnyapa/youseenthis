//
//  UserData.swift
//  youseenthis
//
//  Created by Shawn Yapa on 3/5/22.
//

import Foundation

class UserData: ObservableObject, Codable {
    @Published var user: User
    @Published var items:[Item]
    var version: Semver = Semver(major: 0, minor: 0, patch: 0)
    
    enum CodingKeys: String, CodingKey {
        case user
        case items
        case version
    }
    
    init(user: User, items: [Item]?, version: Semver?) {
        self.user = user
        self.items = items ?? [Item]()
        if let version = version {
            self.version = version
        }
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user = try values.decode(User.self, forKey: .user)
        items = try values.decode([Item].self, forKey: .items)
        version = try values.decode(Semver.self, forKey: .version)
    }
    
    convenience init?(jsonString: String) {
        let decoder = JSONDecoder()
        guard let jsonData = jsonString.data(using: .utf8), let userData = try? decoder.decode(UserData.self, from: jsonData) else {
            return nil
        }
        self.init(user: userData.user, items: userData.items, version: userData.version)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(user, forKey: .user)
        try container.encode(items, forKey: .items)
        try container.encode(version, forKey: .version)
    }
    
    func jsonString() -> String? {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(self) else {
            return nil
        }
       return String(data: data, encoding: .utf8)!
    }
}
