//
//  EditUserViewModel.swift
//  MyPet
//
//  Created by Дина Шварова on 18.07.2023.
//

import UIKit

class EditUserViewModel {
   private let nc: UINavigationController
    
    init(nc: UINavigationController) {
        self.nc = nc
    }
    
    func save (userAvatar: UIImage?, name: String, email: String, role: String) {
//        CoreDataManager.shared.currentUser?.userAvatar = userAvatar
        CoreDataManager.shared.currentUser.userName = name
        CoreDataManager.shared.currentUser.email = email
        CoreDataManager.shared.currentUser.role = role
        nc.popViewController(animated: true)
    }
}

