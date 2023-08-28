//
//  SettingsView.swift
//  MyPet
//
//  Created by Дина Шварова on 11.05.2023.
//

import UIKit

class SettingsView: UIView {
    
    var editProfile: (() -> ())? {
        willSet (newValue) {
            editButton.action = newValue
        }
    }
    
    var logOut: (() -> ())? {
        willSet (newValue) {
            exitButton.action = newValue
        }
    }
    
    var readManifesto: (() -> ())? {
        willSet (newValue) {
            manifestoButton.action = newValue
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel ()
        title.text = NSLocalizedString("Settings", comment: "")
        title.font = .boldSystemFont(ofSize: 24)
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let userAvatar: UIImageView = {
        let avatar = UIImageView ()
        avatar.layer.cornerRadius = 70
        avatar.clipsToBounds = true
        avatar.layer.borderWidth = 0.5
        avatar.layer.masksToBounds = true
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.image = UIImage(named: "Admin avatar")
        avatar.layer.masksToBounds = true
        avatar.contentMode = .scaleAspectFill
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    private let nameLabel: UILabel = {
        let name = UILabel()
        name.textAlignment = .center
//        name.text = "Admin's very long name"
        name.textColor = .white
        name.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var emailLabel: UILabel = {
        let email = UILabel ()
        email.textAlignment = .center
        email.textColor = .CustomColor.neon
//        email.text = "admin@mail.com"
        email.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    private lazy var editButton: CustomButton = {
        let button = CustomButton (title: NSLocalizedString("Edit profile", comment: ""), titleColor: .white, backgroundColor: .CustomColor.buttonBlue)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var exitButton: CustomButton = {
        let button = CustomButton(title: NSLocalizedString("Log Out", comment: ""), titleColor: .white, backgroundColor: .clear)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.CustomColor.buttonBlue.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var manifestoButton: CustomButton = {
        let button = CustomButton (title: NSLocalizedString("Read manifesto", comment: ""), titleColor: .white, backgroundColor: .CustomColor.backgroundLight)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.addArrangedSubviews(editButton, exitButton, manifestoButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubviews(titleLabel, userAvatar, nameLabel, emailLabel, buttonsStackView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            userAvatar.widthAnchor.constraint(equalToConstant: 140),
            userAvatar.heightAnchor.constraint(equalToConstant: 140),
            userAvatar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            userAvatar.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 24),
            
            buttonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            buttonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            buttonsStackView.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 40),
            
            editButton.heightAnchor.constraint(equalToConstant: 48),
            exitButton.heightAnchor.constraint(equalToConstant: 48),
            manifestoButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func addManifestoAction (action: @escaping () -> ()) {
        manifestoButton.action = action
    }
    
}

