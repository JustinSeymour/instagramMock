//
//  Posts.swift
//  FirebaseInstagram
//
//  Created by Justin Seymour on 2018/02/19.
//  Copyright © 2018 Justin Seymour. All rights reserved.
//

import Foundation

struct Post {
    
    let user: User
    let imageUrl: String
    let caption: String
    
    init(user: User, dictionary: [String: Any]) {
        self.user = user
        self.imageUrl = dictionary["imageUrl"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
     }
}
