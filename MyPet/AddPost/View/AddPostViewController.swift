//
//  AddPostViewController.swift
//  MyPet
//
//  Created by Дина Шварова on 09.06.2023.
//

import UIKit

protocol AddPostViewControllerDelegate {
    func setTitleFilter(title: String)
}

class AddPostViewController : UIViewController, UITabBarControllerDelegate {
    
    private let mainView: AddPostView
    private var viewModel: AddPostViewModel?
    
    init(mainView: AddPostView) {
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
    
    func setViewModel (viewModel: AddPostViewModel) {
        self.viewModel = viewModel
    }
    
    @objc func backButtonTouched() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(named: "Back button"), style: .plain, target: self, action: #selector(backButtonTouched))
        backButton.tintColor = .white
        navigationItem.leftBarButtonItem = backButton
    }
}
