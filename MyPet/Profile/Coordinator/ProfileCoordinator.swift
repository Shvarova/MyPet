//
//  ProfileCoordinator.swift
//  MyPet
//
//  Created by Дина Шварова on 11.05.2023.
//

import UIKit

class ProfileCoordinator {

    func getNavigationController () -> UINavigationController {
        let nc = ProfileFactory.getNavigationControlller()
        return nc
    }
}
