//
//  SettingsCoordinator.swift
//  MyPet
//
//  Created by Дина Шварова on 11.05.2023.
//

import UIKit

class SettingsCoordinator {

    func getNavigationController () -> UINavigationController {
        let nc = SettingsFactory.getNavigationControlller()
        return nc
    }
}
