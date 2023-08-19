//
//  LikedCoordinator.swift
//  MyPet
//
//  Created by Дина Шварова on 29.04.2023.
//

import UIKit

class LikedCoordinator {
    
    private lazy var navigation = LikedFactory.getNavigationControlller()
    
    func getNavigationController () -> UINavigationController {
        return navigation
    }
}
