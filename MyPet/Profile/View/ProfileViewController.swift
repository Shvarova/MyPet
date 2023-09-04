//
//  ProfileViewController.swift
//  MyPet
//
//  Created by Дина Шварова on 27.04.2023.
//

import UIKit

class ProfileViewController : UIViewController {
    
    private let mainView: ProfileView
    private var viewModel: ProfileViewModel?
    
    init(mainView: ProfileView) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
        mainView.backgroundColor = .createColor(lightMode: .white, darkMode: .CustomColor.backgroundDark) 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainView.setPosts(posts: viewModel?.posts ?? [])
        if let currentUser = viewModel?.currentUser {
            mainView.setUser(user: currentUser)
        }
        if let currentPet = viewModel?.currentPet {
            mainView.setPet(pet: currentPet)
        }
        navigationController?.navigationBar.isHidden = true
        navigationController?.tabBarController?.tabBar.isHidden = false
    }
    
    func setViewModel (viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        mainView.editPetAction = viewModel.editPet
        mainView.openPhotoGalleryAction = viewModel.openPhotoGallery
        mainView.addPostAction = viewModel.addPost
        mainView.setPosts(posts: viewModel.posts)
        mainView.setUser(user: viewModel.currentUser)
        mainView.setPet(pet: viewModel.currentPet)
    }
}
