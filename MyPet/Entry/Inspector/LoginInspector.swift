//
//  LoginInspector.swift
//  MyPet
//
//  Created by Дина Шварова on 20.08.2023.
//

import Foundation
import FirebaseAuth

protocol LoginViewControllerDelegate {
    func checkCredentials(withEmail: String, password: String, _ completion: ((AuthDataResult?, Error?) -> Void)?)
    func signUp(withEmail: String, password: String, _ completion: ((AuthDataResult?, Error?) -> Void)?)
}

struct LoginInspector: LoginViewControllerDelegate {
    func checkCredentials(withEmail: String, password: String, _ completion: ((AuthDataResult?, Error?) -> Void)?) {
        CheckerService.checkCredentials(withEmail: withEmail, password: password, completion)
    }
    func signUp(withEmail: String, password: String, _ completion: ((AuthDataResult?, Error?) -> Void)?) {
        CheckerService.signUp(withEmail: withEmail, password: password, completion)
    }
}
