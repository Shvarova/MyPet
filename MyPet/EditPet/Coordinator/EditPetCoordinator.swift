//
//  EditPetCoordinator.swift
//  MyPet
//
//  Created by Дина Шварова on 20.08.2023.
//

import UIKit

class EditPetCoordinator {
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func show() {
        let vc = EditPetFactory.getViewControlller(navigation: navigation)
        navigation.pushViewController(vc, animated: true)
    }
}
