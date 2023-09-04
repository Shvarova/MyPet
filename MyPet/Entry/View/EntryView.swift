//
//  EntryView.swift
//  MyPet
//
//  Created by Дина Шварова on 27.04.2023.
//

import UIKit

class EntryView: UIView {
    
    var setCredentials: ((String, String) ->())?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        label.textColor = .createColor(lightMode: .CustomColor.backgroundDark, darkMode: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.text = Labels.Auth.emailLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailTextField: CustomTextField = {
        let textField = CustomTextField(text: "test@test.ru", placeholder: "example@mail.com")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.text = Labels.Auth.passwordLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordTextField: CustomTextField = {
        let textField = CustomTextField(text: "", placeholder: Labels.Auth.passwordPlaceholder)
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var entryButton: CustomButton = {
        let button = CustomButton (title: "".localized, titleColor: .white, backgroundColor: .CustomColor.buttonBlue)
        button.addTarget(self, action: #selector(credentials), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var entryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.addArrangedSubviews(emailLabel, emailTextField, passwordLabel, passwordTextField)
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        activityIndicator.color = .gray
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .createColor(lightMode: .white, darkMode: .CustomColor.backgroundDark)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func credentials () {
        startAI()
        setCredentials?(emailTextField.getText(), passwordTextField.getText())
    }
    
    func startAI() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func stopAI() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func setTitle (title: String) {
        titleLabel.text = title
        entryButton.setTitle(title, for: .normal)
    }
    
    func addAction (action: @escaping (String, String) -> ()) {
        setCredentials = action
    }
    
    private func setupView() {
        addSubviews(titleLabel, entryStackView, entryButton, activityIndicator)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            
            entryStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            entryStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            entryStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            entryStackView.heightAnchor.constraint(equalToConstant: 200),
            
            entryButton.heightAnchor.constraint(equalToConstant: 48),
            entryButton.topAnchor.constraint(equalTo: entryStackView.bottomAnchor, constant: 24),
            entryButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            entryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
