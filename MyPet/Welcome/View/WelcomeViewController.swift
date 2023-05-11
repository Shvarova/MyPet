//
//  WelcomeViewController.swift
//  MyPet
//
//  Created by Дина Шварова on 25.04.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let mainView: WelcomeView
    private var viewModel: WelcomeViewModel?
    
    init(mainView: WelcomeView) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    func setViewModel (viewModel:WelcomeViewModel) {
        self.viewModel = viewModel
        mainView.logIn = viewModel.logIn
        mainView.signUp = viewModel.signUp
    }

}

