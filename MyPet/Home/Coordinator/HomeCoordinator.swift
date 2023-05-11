//
//  HomeCoordinator.swift
//  MyPet
//
//  Created by Дина Шварова on 29.04.2023.
//

import UIKit

class HomeCoordinator {

    func getNavigationController () -> UINavigationController {
        let nc = HomeFactory.getNavigationControlller()
        return nc
    }
}
