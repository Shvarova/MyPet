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

class SettingsCoordinator {

    lazy var navigation = SettingsFactory.getNavigationControlller(output: self)
}

extension SettingsCoordinator: SettingsOutput {
    
    func goToEditUser() {
        let vc = EditUserFactory.getViewControlller(navigation: navigation)
        navigation.pushViewController(vc, animated: true)
    }

    func logOut() {
//        let vc = WelcomeFactory.getNavigationController(output: WelcomeOutput.self as! WelcomeOutput)
//        navigation.pushViewController(vc, animated: true)
    }

    func readManifesto() {
        let vc = ManifestoFactory.getViewControlller(navigation: navigation)
        navigation.pushViewController(vc, animated: true)
    }

    func getNavigationController () -> UINavigationController {
            return navigation
        }
}


