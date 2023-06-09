//
//  HomeViewController.swift
//  MyPet
//
//  Created by Дина Шварова on 27.04.2023.
//

import UIKit

protocol HomeViewControllerDelegate {
    
    func setTitleFilter(title: String)
}

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
        mainView.backgroundColor = .CustomColor.backgroundDark
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setViewModel (viewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.viewModel?.update = mainView.setPosts(posts:)
        mainView.searchAction = {
            self.viewModel?.presentSearchController(delegate: self)
        }
        mainView.resetAction = {
            self.viewModel?.startUpdate(state: .willAppear)
            self.mainView.showSearchButton()
        }
        self.viewModel?.startUpdate(state: .willAppear)
    }
}

extension HomeViewController: HomeViewControllerDelegate {
    func setTitleFilter(title: String) {
        self.viewModel?.startUpdate(state: .filter(title))
        if !title.isEmpty {
            mainView.showResetButton()
        } else {
            mainView.showSearchButton()
            self.viewModel?.startUpdate(state: .willAppear)
        }
    }
}
