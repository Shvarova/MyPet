//
//  PhotoCoordinator.swift
//  MyPet
//
//  Created by Дина Шварова on 16.05.2023.
//

import UIKit

class PhotoCoordinator {
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func show() {
        navigation.navigationBar.isHidden = false
        navigation.tabBarController?.tabBar.isHidden = true
        let vc = PhotoFactory.getViewControlller(navigation: navigation)
        navigation.pushViewController(vc, animated: true)
    }    
}
