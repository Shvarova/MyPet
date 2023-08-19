//
//  SettingsCoordinator.swift
//  MyPet
//
//  Created by Дина Шварова on 11.05.2023.
//

import UIKit

protocol SettingsOutput {
    func goToEditUser ()
    func logOut ()
    func readManifesto ()
}

class SettingsCoordinator: SettingsOutput {
    
    private lazy var navigation = SettingsFactory.getNavigationControlller()
    
    func goToEditUser() {
        let vc = EditUserFactory.getViewControlller(navigation: navigation)
        navigation.pushViewController(vc, animated: true)
    }
    
    func logOut() {
        
    }
    
    func readManifesto() {
        
    }
    
    func getNavigationController () -> UINavigationController {
            return navigation
        }
}


