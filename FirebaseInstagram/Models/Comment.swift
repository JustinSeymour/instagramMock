//
//  Comment.swift
//  FirebaseInstagram
//
//  Created by Justin Seymour on 2018/03/01.
//  Copyright © 2018 Justin Seymour. All rights reserved.
//

import Foundation

struct Comment {
    let user: User
    let text: String
    let uid: String
    
    init(user: User, dictionary: [String: Any]) {
        self.user = user 
        self.text = dictionary["text"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
    }
}
