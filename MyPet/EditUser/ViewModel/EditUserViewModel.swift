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
    
    func save (photo: UIImage?, name: String, breed: String) {
        
        nc.popViewController(animated: true)
    }
}

