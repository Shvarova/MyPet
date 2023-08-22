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
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .darkGray
        label.text = NSLocalizedString("Your email", comment: "")
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
        label.textColor = .darkGray
        label.text = NSLocalizedString("Your password", comment: "")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordTextField: CustomTextField = {
        let textField = CustomTextField(text: "admin123", placeholder: "Password")
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var entryButton: CustomButton = {
        let button = CustomButton (title: NSLocalizedString("", comment: ""), titleColor: .white, backgroundColor: .CustomColor.buttonBlue)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .CustomColor.backgroundDark
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func credentials () {
        setCredentials?(emailTextField.getText(), passwordTextField.getText())
    }
    
    func setTitle (title: String) {
        titleLabel.text = title
        entryButton.setTitle(title, for: .normal)
    }
    
    func addAction (action: @escaping (String, String) -> ()) {
        setCredentials = action
    }
    
    private func setupView() {
        addSubviews(titleLabel, entryStackView, entryButton)
        
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
            entryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48)
        ])
    }
}
