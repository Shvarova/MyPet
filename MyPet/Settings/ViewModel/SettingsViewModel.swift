//
//  SettingsViewModel.swift
//  MyPet
//
//  Created by Дина Шварова on 11.05.2023.
//

import UIKit

class SettingsViewModel {
    
    var output: SettingsOutput?
    
    var currentUser: UserData {
        DataManager.shared.currentUser
    }
    
    func edit () {
        output?.goToEditUser()
    }
    func logOut () {
        output?.logOut()
    }
    func readManifesto () {
        output?.readManifesto()
    }
}
