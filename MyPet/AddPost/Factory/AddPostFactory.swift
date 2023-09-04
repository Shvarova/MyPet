//
//  AddPostFactory.swift
//  MyPet
//
//  Created by Дина Шварова on 23.06.2023.
//

import UIKit

enum AddPostFactory {
    static func getViewControlller (navigation: UINavigationController) -> UIViewController {
        let mainView = AddPostView()
        let vc = AddPostViewController(mainView: mainView)
        let viewModel = AddPostViewModel(nc: navigation)
        vc.setViewModel(viewModel: viewModel)
        navigation.navigationBar.isHidden = false
        navigation.tabBarController?.tabBar.isHidden = true
        return vc
    }
}
