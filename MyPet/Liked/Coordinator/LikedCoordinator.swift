//
//  LikedCoordinator.swift
//  MyPet
//
//  Created by Дина Шварова on 29.04.2023.
//

import UIKit

class LikedCoordinator {

    func getNavigationController () -> UINavigationController {
        let nc = LikedFactory.getNavigationControlller()
        return nc
    }
}
