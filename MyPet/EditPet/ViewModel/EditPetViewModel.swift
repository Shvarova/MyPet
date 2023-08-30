//
//  EditPetViewModel.swift
//  MyPet
//
//  Created by Дина Шварова on 28.06.2023.
//

import UIKit

class EditPetViewModel {
   private let nc: UINavigationController
    
    init(nc: UINavigationController) {
        self.nc = nc
    }
    
    func save (photo: UIImage?, name: String, breed: String) {
        let pet = PetData(id: DataManager.shared.currentUser.id + "_pet", petAvatar: "Pet avatar", petName: name, breed: breed)
        DataManager.shared.savePetData(pet: pet)
        nc.popViewController(animated: true)
    }
}
