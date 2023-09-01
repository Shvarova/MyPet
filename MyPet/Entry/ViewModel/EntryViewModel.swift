//
//  EntryViewModel.swift
//  MyPet
//
//  Created by Дина Шварова on 27.04.2023.
//

import UIKit
import FirebaseAuth

class EntryViewModel {
    
    let entryChoosen: EntryChoosen
    var updateView: ((String, @escaping (String, String) -> ()) -> ())?
    var output: EntryOutput?
    let credentionals = LoginInspector()
    var errorAction: ((String, String) -> ())?
    var loader: UIView?
    
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

    private func logIn (email: String, password: String) {
        credentionals.checkCredentials(withEmail: email, password: password, checkCredentionalsCompletion)
    }
    
    private func signUp (email: String, password: String) {
        credentionals.signUp(withEmail: email, password: password, checkCredentionalsCompletion)
    }
    
    private func checkCredentionalsCompletion (authDataResult: AuthDataResult?, error: Error?) {
        if let authDataResult = authDataResult {
            DataManager.shared.chekUser(userID: authDataResult.user.uid, email: authDataResult.user.email ?? "", completion: {
                self.output?.goToHome()
            })
        } else {
            errorAction?("Error", error?.localizedDescription ?? "")
        }
    }
}
