//
//  MainCoordinator.swift
//  MyPet
//
//  Created by Дина Шварова on 24.08.2023.
//

import UIKit

class MainCoordinator {
    
    private var navigationController: UINavigationController?
    private var window: UIWindow?
    static var shared: MainCoordinator?
    
    private init() {}
    
    static func setMainCoordinator(window: UIWindow?, navigationController: UINavigationController) -> MainCoordinator? {
        if shared == nil {
            shared = MainCoordinator()
            shared?.window = window
            shared?.navigationController = navigationController
        }
        return shared
    }
    
    func showWelcomeScreen() {
        window?.rootViewController = WelcomeCoordinator().nc
        window?.makeKeyAndVisible()
    }
}
