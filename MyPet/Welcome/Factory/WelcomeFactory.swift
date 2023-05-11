//
//  WelcomeFactory.swift
//  MyPet
//
//  Created by Дина Шварова on 26.04.2023.
//

import UIKit

enum WelcomeFactory {
    static func getNavigationController (output: WelcomeOutput) -> UINavigationController {
        let mainView = WelcomeView()
        let viewModel = WelcomeViewModel()
        viewModel.output = output
        let vc = WelcomeViewController (mainView: mainView)
        vc.setViewModel(viewModel: viewModel)
        let nc = UINavigationController(rootViewController: vc)
        return nc
    }
}
