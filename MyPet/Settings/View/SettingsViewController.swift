//
//  SettingsViewController.swift
//  MyPet
//
//  Created by Дина Шварова on 27.04.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let mainView: SettingsView
    private var viewModel: SettingsViewModel?
    
    init(mainView: SettingsView) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
        mainView.backgroundColor = .CustomColor.backgroundDark
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
        }
    
    func setViewModel (viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        mainView.setUserData(userData: viewModel.currentUser)
        mainView.editProfile = viewModel.edit
        mainView.logOut = viewModel.logOut
        mainView.readManifesto = viewModel.readManifesto
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let currentUser = viewModel?.currentUser {
            mainView.setUserData(userData: currentUser)
        }
        navigationController?.navigationBar.isHidden = true
        navigationController?.tabBarController?.tabBar.isHidden = false
    }
}

