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
        title.text = Labels.Settings.titleLabel
        title.font = .boldSystemFont(ofSize: 24)
        title.textColor = .createColor(lightMode: .CustomColor.backgroundDark, darkMode: .white)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let userAvatar: UIImageView = {
        let avatar = UIImageView ()
        avatar.layer.cornerRadius = 70
        avatar.clipsToBounds = true
        avatar.layer.borderWidth = 0.5
        avatar.layer.masksToBounds = true
        avatar.layer.borderColor = UIColor.lightGray.cgColor
        avatar.image = UIImage(named: "User avatar")
        avatar.layer.masksToBounds = true
        avatar.contentMode = .scaleAspectFill
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    private let nameLabel: UILabel = {
        let name = UILabel()
        name.textAlignment = .center
        name.textColor = .createColor(lightMode: .CustomColor.backgroundDark, darkMode: .white)
        name.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var roleLabel: UILabel = {
        let role = UILabel ()
        role.textAlignment = .center
        role.textColor = .CustomColor.emphasis
        role.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        role.translatesAutoresizingMaskIntoConstraints = false
        return role
    }()
    
    private lazy var emailLabel: UILabel = {
        let email = UILabel ()
        email.textAlignment = .center
        email.textColor = .CustomColor.neon
        email.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    private lazy var editButton: CustomButton = {
        let button = CustomButton (title: (Labels.Settings.editButton), titleColor: .white, backgroundColor: .CustomColor.buttonBlue)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var exitButton: CustomButton = {
        let button = CustomButton(title: (Labels.Settings.exitButton), titleColor: .CustomColor.buttonBlue, backgroundColor: .clear)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.CustomColor.buttonBlue.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var manifestoButton: CustomButton = {
        let button = CustomButton (title: (Labels.Settings.manifestoButton), titleColor: .CustomColor.emphasis, backgroundColor: .clear)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.CustomColor.emphasis.cgColor
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
    
    func setUserData(userData: UserData) {
        let userAvatarURL = URL(string: userData.userAvatar)
        if let userAvatarURL = userAvatarURL {
            userAvatar.load(url: userAvatarURL)
        } else {
            userAvatar.image = UIImage(named: "User avatar")
        }
        emailLabel.text = userData.email
        nameLabel.text = userData.userName
        roleLabel.text = userData.role
    }
    
    private func setupView() {
        addSubviews(titleLabel, userAvatar, nameLabel, roleLabel, emailLabel, buttonsStackView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            userAvatar.widthAnchor.constraint(equalToConstant: 140),
            userAvatar.heightAnchor.constraint(equalToConstant: 140),
            userAvatar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            userAvatar.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 16),
            emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 24),
            
            nameLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            roleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            roleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            roleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            buttonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            buttonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            buttonsStackView.topAnchor.constraint(equalTo: roleLabel.bottomAnchor, constant: 40),
            
            editButton.heightAnchor.constraint(equalToConstant: 48),
            exitButton.heightAnchor.constraint(equalToConstant: 48),
            manifestoButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func addManifestoAction (action: @escaping () -> ()) {
        manifestoButton.action = action
    }
    
}

