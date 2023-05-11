//
//  TabBarCoordinator.swift
//  MyPet
//
//  Created by Дина Шварова on 29.04.2023.
//

import UIKit


final class TabBarCoordinator {
    
    private let navigationController: UINavigationController
    private let controller: UITabBarController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController

        let homeNC = HomeCoordinator().getNavigationController()
        let profileNC = ProfileCoordinator().getNavigationController()
        let likedNC = LikedCoordinator().getNavigationController()
        let settingsNC = SettingsCoordinator().getNavigationController()
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeNC, profileNC, likedNC, settingsNC]
        controller = tabBarController
        
        let homeItem = UITabBarItem(title: nil, image: UIImage(systemName: "square.grid.2x2.fill"), tag: 0)
        homeNC.tabBarItem = homeItem
        
        let profileItem = UITabBarItem(title: nil, image: UIImage(systemName: "person.crop.circle.fill"), tag: 1)
        profileNC.tabBarItem = profileItem
        
        let likedItem = UITabBarItem(title: nil, image: UIImage(systemName: "heart.fill"), tag: 2)
        likedNC.tabBarItem = likedItem
        
        let settingsItem = UITabBarItem(title: nil, image: UIImage(systemName: "gearshape.fill"), tag: 3)
        settingsNC.tabBarItem = settingsItem
        
        setUpTabBar ()
        
    }
    
    func start() {
        navigationController.setViewControllers([controller], animated: true)
    }
    
    private func setUpTabBar () {
        controller.tabBar.backgroundColor = .CustomColor.backgroundLight
        controller.tabBar.tintColor = .white
        controller.tabBar.unselectedItemTintColor = .darkGray
        controller.tabBar.isTranslucent = false
    }
}
