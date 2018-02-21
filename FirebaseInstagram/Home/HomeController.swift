//
//  HomeController.swift
//  FirebaseInstagram
//
//  Created by Justin Seymour on 2018/02/20.
//  Copyright © 2018 Justin Seymour. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let CellId = "CellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(HomePostCell.self, forCellWithReuseIdentifier: CellId)
        setupNavigationItems()
        fetchPosts()
    }
    
    fileprivate func setupNavigationItems() {
        navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "logo2"))
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId, for: indexPath) as! HomePostCell
        cell.post = posts[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height: CGFloat = 40 + 8 + 8
        height += view.frame.width
        height += 50
        height += 60
        return CGSize(width: view.frame.width, height: height)
    }
    
    var posts = [Post]()
    fileprivate func fetchPosts() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        Database.database().reference().child("users").child(uid).observe(.value, with: { (snapshot) in
            
            guard let userDictionary = snapshot.value as? [String: Any] else { return }
            
            let user = User(dictionary: userDictionary)
            
            let ref = Database.database().reference().child("posts").child(uid)
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                
                guard let dictionaries = snapshot.value as? [String: Any] else { return }
                dictionaries.forEach({ (key, value) in
                    
                    guard let dictionary = value as? [String: Any] else { return }
                    let imageUrl = dictionary["imageUrl"] as? String ?? ""
                    print("Image URL: \(imageUrl)")
                    
                    //let dummyUser = User(dictionary: ["username": "jseymour"])
                    
                    let post = Post(user: user, dictionary: dictionary)
                    print(post.imageUrl)
                    self.posts.append(post)
                })
                
                self.collectionView?.reloadData()
                
            }) { (err) in
                print("Failed to fetch posts:", err)
            }
        
        }) { (err) in
            print("Failed to fetch user for posts:", err)
        }
        
        
    }
    
}
