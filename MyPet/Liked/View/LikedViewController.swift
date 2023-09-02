//
//  LikedViewController.swift
//  MyPet
//
//  Created by Дина Шварова on 27.04.2023.
//

import UIKit

class LikedViewController : UIViewController {
    
    private let mainView: LikedView
    private var viewModel: LikedViewModel?
    
    init(mainView: LikedView) {
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
    
    func setViewModel (viewModel: LikedViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainView.setPosts(posts: viewModel?.posts ?? [])
    }
}

