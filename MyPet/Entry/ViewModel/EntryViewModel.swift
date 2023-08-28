//
//  EntryViewModel.swift
//  MyPet
//
//  Created by Дина Шварова on 27.04.2023.
//

import UIKit
import FirebaseAuth

protocol EntryViewModelProtocol {
    func checkCredentionalsToLogIn(email: String, password: String)
    func checkCredentionalsForRegistration(email: String, password: String)
}

class EntryViewModel: EntryViewModelProtocol {
    
    let entryChoosen: EntryChoosen
    var updateView: ((String, @escaping (String, String) -> ()) -> ())?
    var output: EntryOutput?
    let credentionals = LoginInspector()
    var errorAction: ((String, String) -> ())?
    
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
    
    func checkCredentionalsToLogIn(email: String, password: String) {
        credentionals.checkCredentials(withEmail: email, password: password, checkCredentionalsCompletion)
    }
        
    func checkCredentionalsForRegistration(email: String, password: String) {
        credentionals.signUp(withEmail: email, password: password, checkCredentionalsCompletion)
    }

    private func logIn (email: String, password: String) {
       
        credentionals.checkCredentials(withEmail: email, password: password, checkCredentionalsCompletion)
        
    }
    
    private func signUp (email: String, password: String) {
        checkCredentionalsForRegistration(email: email, password: password)
    }
    
    private func checkCredentionalsCompletion (authDataResult: AuthDataResult?, error: Error?) {
        if let authDataResult = authDataResult {
            CoreDataManager.shared.currentUser = UserData(id: authDataResult.user.uid, userAvatar: "", userName: "", petID: "", email: authDataResult.user.email ?? "", role: "")
            output?.goToHome()
        } else {
            errorAction?("Error", error?.localizedDescription ?? "")
        }
    }
}
