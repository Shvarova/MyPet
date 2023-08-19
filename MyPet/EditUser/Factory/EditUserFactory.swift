//
//  EditUserFactory.swift
//  MyPet
//
//  Created by Дина Шварова on 18.07.2023.
//

import UIKit

enum EditUserFactory {
    static func getViewControlller (navigation: UINavigationController) -> UIViewController {
        let mainView = EditUserView()
        let vc = EditUserViewController(mainView: mainView)
        let viewModel = EditUserViewModel(nc: navigation)
        vc.setViewModel(viewModel: viewModel)
        return vc
    }
}
