//
//  ProfileFactory.swift
//  MyPet
//
//  Created by Дина Шварова on 11.05.2023.
//

import UIKit

enum ProfileFactory {
    static func getNavigationControlller () -> UINavigationController {
        let mainView = ProfileView()
        let vc = ProfileViewController(mainView: mainView)
        let viewModel = ProfileViewModel()
        vc.setViewModel(viewModel: viewModel)
        let nc = UINavigationController(rootViewController: vc)
        return nc
    }
}
