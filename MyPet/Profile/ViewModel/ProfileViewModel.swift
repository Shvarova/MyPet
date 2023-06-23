//
//  ProfileViewModel.swift
//  MyPet
//
//  Created by Дина Шварова on 11.05.2023.
//

import UIKit

class ProfileViewModel {
    
    var posts: [Post] {
        Posts.shared.posts
    }
    
    var output: ProfileOutput?
    
    func editPet() {
        output?.editPet()
    }
    
    func openPhotoGallery() {
        output?.openPhotoGallery()
    }
    
    func addPost() {
        output?.addPost()
    }
}
