//
//  CheckerService.swift
//  MyPet
//
//  Created by Дина Шварова on 20.08.2023.
//

import FirebaseAuth

protocol CheckerServiceProtocol {
    static func checkCredentials(withEmail: String, password: String, _ completion: ((AuthDataResult?, Error?) -> ())?)
    static func signUp(withEmail: String, password: String, _ completion: ((AuthDataResult?, Error?) -> ())?)
}

class CheckerService: CheckerServiceProtocol {
    static func checkCredentials(withEmail: String, password: String, _ completion: ((AuthDataResult?, Error?) -> ())? = nil) {
        Auth.auth().signIn(withEmail: withEmail, password: password, completion: completion)
    }

    static func signUp(withEmail: String, password: String, _ completion: ((AuthDataResult?, Error?) -> ())? = nil) {
        Auth.auth().createUser(withEmail: withEmail, password: password, completion: completion)
    }
}
