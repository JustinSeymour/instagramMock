//
//  CustomImageView.swift
//  FirebaseInstagram
//
//  Created by Justin Seymour on 2018/02/19.
//  Copyright © 2018 Justin Seymour. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {
    
    var lastUrlUsedToLoadImage: String?
    
    func loadImage(urlString: String) {
        print("Loading Image..")
        
        lastUrlUsedToLoadImage = urlString
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print("Failed to fetch post image:", err)
                return
            }
            
            if url.absoluteString != self.lastUrlUsedToLoadImage {
                return
            }
            
            guard let imageData = data else {return}
            let photoImage = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image = photoImage
            }
            }.resume()
    }
    
}
