//
//  SettingsFactory.swift
//  MyPet
//
//  Created by Дина Шварова on 11.05.2023.
//

import UIKit

enum SettingsFactory {
    static func getNavigationControlller () -> UINavigationController {
        let mainView = SettingsView()
        let vc = SettingsViewController(mainView: mainView)
        let viewModel = SettingsViewModel()
        vc.setViewModel(viewModel: viewModel)
        let nc = UINavigationController(rootViewController: vc)
        return nc
    }
}
