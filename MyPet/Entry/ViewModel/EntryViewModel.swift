//
//  EntryViewModel.swift
//  MyPet
//
//  Created by Дина Шварова on 27.04.2023.
//

import UIKit

class EntryViewModel {
    let entryChoosen: EntryChoosen
    var updateView: ((String, @escaping () -> ()) -> ())?
    var output: EntryOutput?
    
    init(entryChoosen: EntryChoosen) {
        self.entryChoosen = entryChoosen
    }
    
    func updateModel () {
        switch entryChoosen {
        case .logIn:
          updateView?(NSLocalizedString("Log In", comment: ""), logIn)
        case .signUp:
            updateView?(NSLocalizedString("Sign Up", comment: ""), signUp)
        }
    }
    
    private func logIn () {
        output?.goToHome()
    }
    private func signUp () {
        output?.goToHome()
    }
}
