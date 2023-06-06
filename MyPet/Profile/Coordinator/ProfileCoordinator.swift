//
//  ProfileCoordinator.swift
//  MyPet
//
//  Created by Дина Шварова on 11.05.2023.
//

import UIKit

protocol ProfileOutput {
    func editPet()
    func openPhotoGallery()
    func addPost()
}

class ProfileCoordinator: ProfileOutput {
    func editPet() {

    }
    
    func openPhotoGallery() {
        
    }
    
    func addPost() {
        print()
    }
    
    func getNavigationController () -> UINavigationController {
        let nc = ProfileFactory.getNavigationControlller(output: self)
        return nc
    }
}
