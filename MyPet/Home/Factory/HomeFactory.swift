//
//  HomeFactory.swift
//  MyPet
//
//  Created by Дина Шварова on 29.04.2023.
//

import UIKit

enum HomeFactory {
    static func getNavigationControlller (output: HomeOutput) -> UINavigationController {
        let mainView = HomeView()
        let vc = HomeViewController(mainView: mainView)
        let viewModel = HomeViewModel()
        viewModel.output = output
        vc.setViewModel(viewModel: viewModel)
        let nc = UINavigationController(rootViewController: vc)
        nc.navigationBar.isHidden = true
        return nc
    }
}

