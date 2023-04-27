//
//  AuthViewController.swift
//  MyPet
//
//  Created by Дина Шварова on 25.04.2023.
//

import UIKit

class AuthViewController: UIViewController {
    
    private let mainView: AuthView
    private var viewModel: AuthViewModel?
    
    init(mainView: AuthView) {
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
    
    
    
    func setViewModel (viewModel:AuthViewModel) {
        self.viewModel = viewModel
    }

}

