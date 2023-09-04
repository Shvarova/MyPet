//
//  ManifestoFactory.swift
//  MyPet
//
//  Created by Дина Шварова on 20.08.2023.
//

import UIKit

enum ManifestoFactory {
    static func getViewControlller (navigation: UINavigationController) -> UIViewController {
        let mainView = ManifestoView()
        let vc = ManifestoViewController(mainView: mainView)
        let viewModel = ManifestoViewModel(nc: navigation)
        vc.setViewModel(viewModel: viewModel)
        navigation.navigationBar.isHidden = false
        navigation.tabBarController?.tabBar.isHidden = true
        return vc
    }
}
