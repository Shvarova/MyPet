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
   let petID = DataManager.shared.currentUser.id + "_pet"
        if let petAvatar = photo {
            ImageManager.uploadPetAvatar(id: petID, photo: petAvatar, completion: { result in
                var imageURL: URL?
                switch result {
                case .success(let url):
                    imageURL = url
                case .failure(_):
                    imageURL = nil
                }
                
                self.savePetData(petID: petID, petAvatar: imageURL, name: name, breed: breed)
            })
        } else {
            self.savePetData(petID: petID, petAvatar: nil, name: name, breed: breed)
        }
    }
    
    private func savePetData (petID: String, petAvatar: URL?, name: String, breed: String) {
        let imageURLString = petAvatar?.absoluteString ?? ""
        let pet = PetData(id: petID, petAvatar: imageURLString, petName: name, breed: breed)
        DataManager.shared.updateCurrentPet(pet: pet)
        nc.popViewController(animated: true)
    }
}
