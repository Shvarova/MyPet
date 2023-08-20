//
//  SettingsFactory.swift
//  MyPet
//
//  Created by Дина Шварова on 11.05.2023.
//

import UIKit

enum SettingsFactory {
    static func getNavigationControlller (output: SettingsOutput) -> UINavigationController {
        let mainView = SettingsView()
        let viewModel = SettingsViewModel()
        viewModel.output = output
        let vc = SettingsViewController(mainView: mainView)
        vc.setViewModel(viewModel: viewModel)
        let nc = UINavigationController(rootViewController: vc)
        nc.navigationBar.isHidden = true
        return nc
    }
}
