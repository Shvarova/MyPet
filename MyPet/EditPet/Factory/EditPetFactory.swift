//
//  EditPetFactory.swift
//  MyPet
//
//  Created by Дина Шварова on 28.06.2023.
//

import UIKit

enum EditPetFactory {
    static func getViewControlller (navigation: UINavigationController) -> UIViewController {
        let mainView = EditPetView()
        let vc = EditPetViewController(mainView: mainView)
        let viewModel = EditPetViewModel(nc: navigation)
        vc.setViewModel(viewModel: viewModel)
        navigation.navigationBar.isHidden = false
        navigation.tabBarController?.tabBar.isHidden = true
        return vc
    }
}
