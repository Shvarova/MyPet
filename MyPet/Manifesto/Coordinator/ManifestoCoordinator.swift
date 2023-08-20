//
//  ManifestoCoordinator.swift
//  MyPet
//
//  Created by Дина Шварова on 20.08.2023.
//

import UIKit

class ManifestoCoordinator {
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func show() {
        let vc = ManifestoFactory.getViewControlller(navigation: navigation)
        navigation.pushViewController(vc, animated: true)
    }
}
