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
    private lazy var navigation = ProfileFactory.getNavigationControlller(output: self)
        
    func editPet() {
        
    }
    
    func openPhotoGallery() {
        let coordinator = PhotoCoordinator(navigation: navigation)
        coordinator.show()
    }
    
    func addPost() {
        let vc = AddPostFactory.getViewControlller(navigation: navigation)
        navigation.pushViewController(vc, animated: true)
    }
    
    func getNavigationController () -> UINavigationController {
        return navigation
    }
}
