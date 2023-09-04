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
            var errorText = Labels.Auth.unknownError
            if let error = error as NSError? {
                if let errorCode = AuthErrorCode.Code(rawValue: error.code) {
                    switch errorCode {
                    case .emailAlreadyInUse, .credentialAlreadyInUse:
                        errorText = Labels.Auth.credentialError
                    case .invalidCredential, .invalidEmail, .wrongPassword:
                        errorText = Labels.Auth.invalidError
                    case .userNotFound, .userDisabled:
                        errorText = Labels.Auth.userNotFoundError
                    default:
                        errorText = Labels.Auth.unknownError
                    }
                }
            }
            errorAction?(Labels.Auth.errorAction, errorText)
        }
    }
    
    private func checkCredentionals(email: String, password: String)  {
        if !emailIsValid(email) && !passwordIsValid(password) {
            errorAction?(Labels.Auth.credentionalsFormatError, Labels.Auth.checkSpelling)
        } else if !emailIsValid(email) {
            errorAction?(Labels.Auth.emailFormatError, Labels.Auth.checkEmailFormat)
        } else if !passwordIsValid(password) {
            errorAction?(Labels.Auth.weakPasswordError, Labels.Auth.passwordRules)
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
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{6,}")
            return passwordTest.evaluate(with: password)
        }
}
