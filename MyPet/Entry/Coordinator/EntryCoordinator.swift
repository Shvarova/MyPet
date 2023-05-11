//
//  EntryCoordinator.swift
//  MyPet
//
//  Created by Дина Шварова on 27.04.2023.
//

import UIKit

enum EntryChoosen {
    case logIn
    case signUp
}

protocol EntryOutput {
    func goToHome ()
}

class EntryCoordinator {
    let nc: UINavigationController
    
    init(nc: UINavigationController) {
        self.nc = nc
    }
    
    func show (entryChoosen: EntryChoosen) {
        let vc = EntryFactory.getViewControlller(entryChoosen: entryChoosen, output: self)
        nc.pushViewController(vc, animated: true)
    }
}

extension EntryCoordinator: EntryOutput {
    func goToHome() {
        let coordinator = TabBarCoordinator(navigationController: nc)
        coordinator.start()
    }
}
