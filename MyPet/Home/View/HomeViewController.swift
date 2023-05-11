//
//  HomeViewController.swift
//  MyPet
//
//  Created by Дина Шварова on 27.04.2023.
//

import UIKit

class HomeViewController : UIViewController, UITabBarControllerDelegate {
    private let mainView: HomeView
    private var viewModel: HomeViewModel?
    
    init(mainView: HomeView) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
        mainView.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setViewModel (viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
}
