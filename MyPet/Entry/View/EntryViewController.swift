//
//  EntryViewController.swift
//  MyPet
//
//  Created by Дина Шварова on 27.04.2023.
//

import UIKit

class EntryViewController: UIViewController {
    
    private let mainView: EntryView
    private var viewModel: EntryViewModel?
    
    init(mainView: EntryView) {
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
        setNavigationBar()
        addTapToHideKeyboard()
    }
    
    func setViewModel (viewModel: EntryViewModel) {
        self.viewModel = viewModel
        viewModel.updateView = { title, action in
            self.mainView.setTitle(title: title)
            self.mainView.addAction(action: action)
        }
        viewModel.updateModel()
        viewModel.errorAction = showAlert(title: message:)
    }
    
    @objc func backButtonTouched() {
        navigationController?.popViewController(animated: true)
    }
    
    private func addTapToHideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        mainView.addGestureRecognizer(tap)
    }
    
    @objc private func hideKeyboard() {
        mainView.endEditing(true)
    }
    
    private func showAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction (title: Labels.Auth.alert, style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    private func setNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(named: "Back button"), style: .plain, target: self, action: #selector(backButtonTouched))
        backButton.tintColor = .white
        navigationItem.leftBarButtonItem = backButton
    }
}
