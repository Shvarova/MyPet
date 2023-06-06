//
//  ProfileViewModel.swift
//  MyPet
//
//  Created by Дина Шварова on 11.05.2023.
//

import UIKit

class ProfileViewModel {
    
   var posts = Posts().posts
    
    var output: ProfileOutput?
    
    func editPet() {
        
    }
    
    func openPhotoGallery() {
        output?.openPhotoGallery()
    }
    
    func addPost() {
        output?.addPost()
    }
}
