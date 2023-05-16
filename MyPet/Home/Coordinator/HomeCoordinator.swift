//
//  HomeCoordinator.swift
//  MyPet
//
//  Created by Дина Шварова on 29.04.2023.
//

import UIKit

protocol HomeOutput {
    func presentSearchController(delegate: HomeViewControllerDelegate)
}

class HomeCoordinator {
    
    private lazy var nc = HomeFactory.getNavigationControlller(output: self)

    func getNavigationController () -> UINavigationController {
        return nc
    }
}

extension HomeCoordinator: HomeOutput {
    func presentSearchController(delegate: HomeViewControllerDelegate) {
        let vc = SearchViewController()
        vc.delegate = delegate
        nc.present(vc, animated: true)
    }
}
