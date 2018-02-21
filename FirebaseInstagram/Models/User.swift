//
//  User.swift
//  FirebaseInstagram
//
//  Created by Justin Seymour on 2018/02/21.
//  Copyright © 2018 Justin Seymour. All rights reserved.
//

import Foundation

struct User {
    let username: String
    let profileImageUrl: String
    
    init(dictionary: [String: Any]) {
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    }
}
