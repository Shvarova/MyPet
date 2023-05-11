//
//  LikedFactory.swift
//  MyPet
//
//  Created by Дина Шварова on 29.04.2023.
//

import UIKit

enum LikedFactory {
    static func getNavigationControlller () -> UINavigationController {
        let mainView = LikedView()
        let vc = LikedViewController(mainView: mainView)
        let viewModel = LikedViewModel()
        vc.setViewModel(viewModel: viewModel)
        let nc = UINavigationController(rootViewController: vc)
        return nc
    }
}
