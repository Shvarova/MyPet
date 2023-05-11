//
//  HomeFactory.swift
//  MyPet
//
//  Created by Дина Шварова on 29.04.2023.
//

import UIKit

enum HomeFactory {
    static func getNavigationControlller () -> UINavigationController {
        let mainView = HomeView()
        let vc = HomeViewController(mainView: mainView)
        let viewModel = HomeViewModel()
        vc.setViewModel(viewModel: viewModel)
        let nc = UINavigationController(rootViewController: vc)
        return nc
    }
}

