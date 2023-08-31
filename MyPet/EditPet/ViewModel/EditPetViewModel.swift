//
//  EditPetViewModel.swift
//  MyPet
//
//  Created by Дина Шварова on 28.06.2023.
//

import UIKit

class EditPetViewModel {
   private let nc: UINavigationController
    
    var currentPet: PetData {
        DataManager.shared.currentPet
    }
    
    init(nc: UINavigationController) {
        self.nc = nc
    }
    
    func save (photo: UIImage?, name: String, breed: String) {
        if let petAvatar = photo {
            ImageManager.uploadPetAvatar(id: DataManager.shared.currentPet.id, photo: petAvatar, completion: { result in
                var imageURL: URL?
                switch result {
                case .success(let url):
                    imageURL = url
                case .failure(_):
                    imageURL = nil
                }
                self.savePetData(petAvatar: imageURL, name: name, breed: breed)
            })
        } else {
            self.savePetData(petAvatar: nil, name: name, breed: breed)
        }
    }
    
    private func savePetData (petAvatar: URL?, name: String, breed: String) {
        let imageURLString = petAvatar?.absoluteString ?? ""
        let pet = PetData(id: DataManager.shared.currentPet.id, petAvatar: imageURLString, petName: name, breed: breed)
        DataManager.shared.updateCurrentPet(pet: pet)
        nc.popViewController(animated: true)
    }
}
