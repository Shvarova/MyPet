//
//  WelcomeViewModel.swift
//  MyPet
//
//  Created by Дина Шварова on 26.04.2023.
//

import UIKit

class WelcomeViewModel {
    var output: WelcomeOutput?
   
    func logIn () {
        output?.logIn()
    }
    func signUp () {
        output?.signUp()
    }
}
