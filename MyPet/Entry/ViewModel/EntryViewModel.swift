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
            updateView?(Labels.Auth.logIn, logIn)
        case .signUp:
            updateView?(Labels.Auth.signUp, signUp)
        }
    }
    
    private func logIn (email: String, password: String) {
        credentionals.checkCredentials(withEmail: email, password: password, checkCredentionalsCompletion)
    }
    
    private func signUp (email: String, password: String) {
        checkCredentionals(email: email, password: password)
        
    }
    
    private func checkCredentionalsCompletion (authDataResult: AuthDataResult?, error: Error?) {
        if let authDataResult = authDataResult {
            DataManager.shared.chekUser(userID: authDataResult.user.uid, email: authDataResult.user.email ?? "", completion: {
                self.output?.goToHome()
            })
        } else {
            var errorText = "Unknown error"
            if let error = error as NSError? {
                if let errorCode = AuthErrorCode.Code(rawValue: error.code) {
                    switch errorCode {
                    case .emailAlreadyInUse, .credentialAlreadyInUse:
                        errorText = "Email Already In Use"
                    default:
                        errorText = "???"
                    }
                    
                }
            }
            errorAction?(Labels.Auth.errorAction, errorText)
        }
    }
    
    private func checkCredentionals(email: String, password: String)  {
        if !emailIsValid(email) && !passwordIsValid(password) {
            errorAction?("Invalid credentionals format".localized, "Check your email and password spelling".localized)
        } else if !emailIsValid(email) {
            errorAction?("Invalid email format".localized, "Check your email spelling".localized)
        } else if !passwordIsValid(password) {
            errorAction?("Weak password".localized, "Password must be 6 or more characters".localized)
        } else {
            credentionals.signUp(withEmail: email, password: password, checkCredentionalsCompletion)
        }
    }
        private func emailIsValid(_ email: String) -> Bool {
            let emailRegEx = "([a-z0-9.]){1,64}@([a-z0-9]){1,64}\\.([a-z0-9]){2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
            return emailTest.evaluate(with: email)
        }
    
        private func passwordIsValid(_ password: String) -> Bool {
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
            return passwordTest.evaluate(with: password)
        }
}
