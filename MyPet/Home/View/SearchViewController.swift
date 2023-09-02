//
//  SearchViewController.swift
//  MyPet
//
//  Created by Дина Шварова on 13.05.2023.
//

import UIKit

final class SearchViewController: UIViewController {
    
    var delegate: HomeViewControllerDelegate?
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = .CustomColor.backgroundLight
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: textField.frame.height))
        textField.layer.borderWidth = 0.5
        textField.textColor = .white
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var searchButton: CustomButton = {
        let button = CustomButton(title: (Labels.Home.search), titleColor: .white, backgroundColor: .CustomColor.buttonBlue, cornerRadius: 12)
        button.action = searchButtonTouched
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupView()
        addTapToDismissController()
        addTapToHideKeyboard()
    }
    
    private func setupView() {
        view.addSubview(mainView)
        mainView.addSubviews(textField, searchButton)
        
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            mainView.heightAnchor.constraint(equalToConstant: 100),
                        
            textField.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 8),
            textField.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            textField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -8),
            
            searchButton.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            searchButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -8),
            searchButton.heightAnchor.constraint(equalTo: textField.heightAnchor),
            searchButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func addTapToDismissController() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissController))
        view.addGestureRecognizer(tap)
    }
    
    private func addTapToHideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        mainView.addGestureRecognizer(tap)
    }
    
    @objc private func searchButtonTouched() {
        delegate?.setTitleFilter(title: textField.text ?? "")
        dismiss(animated: true)
    }
    
    @objc private func hideKeyboard() {
        mainView.endEditing(true)
    }
    
    @objc private func dismissController() {
        dismiss(animated: true)
    }
}
