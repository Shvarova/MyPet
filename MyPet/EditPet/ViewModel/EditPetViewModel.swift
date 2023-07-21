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
        
        nc.popViewController(animated: true)
    }
}
