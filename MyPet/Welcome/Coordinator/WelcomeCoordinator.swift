//
//  WelcomeCoordinator.swift
//  MyPet
//
//  Created by Дина Шварова on 26.04.2023.
//

import UIKit

protocol WelcomeOutput {
    func logIn ()
    func signUp ()
}

class WelcomeCoordinator {
    
    lazy var nc = WelcomeFactory.getNavigationController(output: self)
}

extension WelcomeCoordinator: WelcomeOutput {
    func logIn() {
        let entryCoordinator = EntryCoordinator(nc: nc)
        entryCoordinator.show(entryChoosen: .logIn)
    }
    func signUp() {
        let entryCoordinator = EntryCoordinator(nc: nc)
        entryCoordinator.show(entryChoosen: .signUp)
    }
}
