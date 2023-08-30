//
//  ProfileViewModel.swift
//  MyPet
//
//  Created by Дина Шварова on 11.05.2023.
//

import UIKit

class ProfileViewModel {
    
    var posts: [PostData] {
        DataManager.shared.getAllPosts(userID: "2")
    }
    
    var currentUser: UserData {
        DataManager.shared.currentUser
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
