//
//  ProfileFactory.swift
//  MyPet
//
//  Created by Дина Шварова on 11.05.2023.
//

import UIKit

enum ProfileFactory {
    static func getNavigationControlller (output: ProfileOutput) -> UINavigationController {
        let mainView = ProfileView()
        let vc = ProfileViewController(mainView: mainView)
        let viewModel = ProfileViewModel()
        viewModel.output = output
        vc.setViewModel(viewModel: viewModel)
        let nc = UINavigationController(rootViewController: vc)
        nc.navigationBar.isHidden = true
        return nc
    }
}
