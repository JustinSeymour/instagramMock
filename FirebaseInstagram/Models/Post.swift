//
//  Posts.swift
//  FirebaseInstagram
//
//  Created by Justin Seymour on 2018/02/19.
//  Copyright © 2018 Justin Seymour. All rights reserved.
//

import Foundation

struct Post {
    let imageUrl: String
    
    
    init(dictionary: [String: Any]) {
        self.imageUrl = dictionary["imageUrl"] as? String ?? ""
    }
}
