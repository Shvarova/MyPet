//
//  AddPostViewModel.swift
//  MyPet
//
//  Created by Дина Шварова on 09.06.2023.
//

import UIKit

class AddPostViewModel {
   private let nc: UINavigationController
    
    init(nc: UINavigationController) {
        self.nc = nc
    }
    
    func publish (image: UIImage?, title: String, description: String) {
        Posts.shared.posts.append(Post(authorAvatar: "Admin avatar", authorName: "my pet", date: Date(), title: title, description: description, image: "", like: 0, comment: 0))
        nc.popViewController(animated: true)
    }
}
