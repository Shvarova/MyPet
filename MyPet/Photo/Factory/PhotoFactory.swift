//
//  PhotoFactory.swift
//  MyPet
//
//  Created by Дина Шварова on 16.06.2023.
//

import UIKit

enum PhotoFactory {
    static func getViewControlller (navigation: UINavigationController) -> UIViewController {
        let vc = PhotoViewController()
        navigation.navigationBar.isHidden = false
        navigation.tabBarController?.tabBar.isHidden = true
        return vc
    }
}
