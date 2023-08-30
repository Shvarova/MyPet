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
        let user = UserData(id: DataManager.shared.currentUser.id, userAvatar: "User avatar", userName: name, petID: DataManager.shared.currentUser.petID, email: email, role: role)
        DataManager.shared.updateCurrentUser(user: user)
        nc.popViewController(animated: true)
    }
}

