//
//  AddPostViewModel.swift
//  MyPet
//
//  Created by Дина Шварова on 09.06.2023.
//

import UIKit

class AddPostViewModel {
   private let nc: UINavigationController
    let coreDataManager = DataManager.shared
    
    init(nc: UINavigationController) {
        self.nc = nc
    }
    
    func publish (image: UIImage?, title: String, description: String) {
        coreDataManager.savePostData(title: title, description: description, image: image)
        nc.popViewController(animated: true)
    }
}
