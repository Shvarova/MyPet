//
//  EditUserViewModel.swift
//  MyPet
//
//  Created by Дина Шварова on 18.07.2023.
//

import UIKit

class EditUserViewModel {
    
    private let nc: UINavigationController
    
    var currentUser: UserData {
        DataManager.shared.currentUser
    }
    
    init(nc: UINavigationController) {
        self.nc = nc
    }
    
    func save (userAvatar: UIImage?, name: String, role: String) {
        
        if let userAvatar = userAvatar {
            ImageManager.uploadUserAvatar(id: DataManager.shared.currentUser.id, photo: userAvatar, completion: { result in
                var imageURL: URL?
                switch result {
                case .success(let url):
                    imageURL = url
                case .failure(_):
                    imageURL = nil
                }
                self.saveUserData(userAvatar: imageURL, name: name, role: role)
            })
        } else {
            self.saveUserData(userAvatar: nil, name: name, role: role)
        }
    }
    
    private func saveUserData (userAvatar: URL?, name: String, role: String) {
        let imageURLString = userAvatar?.absoluteString ?? ""
        let user = UserData(id: DataManager.shared.currentUser.id, userAvatar: imageURLString, userName: name, petID: DataManager.shared.currentUser.petID, email: DataManager.shared.currentUser.email, role: role)
        DataManager.shared.updateCurrentUser(user: user)
        nc.popViewController(animated: true)
    }
}

