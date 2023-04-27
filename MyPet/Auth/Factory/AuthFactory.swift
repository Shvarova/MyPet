//
//  AuthFactory.swift
//  MyPet
//
//  Created by Дина Шварова on 26.04.2023.
//

import UIKit

enum AuthFactory {
    static func getNavigationController () -> UINavigationController {
        let mainView = AuthView()
        let viewModel = AuthViewModel()
        let vc = AuthViewController (mainView: mainView)
        vc.setViewModel(viewModel: viewModel)
        let nc = UINavigationController(rootViewController: vc)
        return nc
    }
}
