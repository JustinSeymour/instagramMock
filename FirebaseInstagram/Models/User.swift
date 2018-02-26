//
//  User.swift
//  FirebaseInstagram
//
//  Created by Justin Seymour on 2018/02/21.
//  Copyright © 2018 Justin Seymour. All rights reserved.
//

import Foundation

struct User {
    let uid: String
    let username: String
    let profileImageUrl: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    }
}
