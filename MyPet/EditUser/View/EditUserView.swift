//
//  EditUserView.swift
//  MyPet
//
//  Created by Дина Шварова on 18.07.2023.
//

import UIKit

class EditUserView: UIView {
    
    var saveAction: ((UIImage?, String, String) ->())?
    var openGalleryAction: (() -> ())?
    
    private let userAvatar: UIImageView = {
        let avatar = UIImageView ()
        avatar.layer.cornerRadius = 70
        avatar.clipsToBounds = true
        avatar.layer.borderWidth = 0.5
        avatar.layer.masksToBounds = true
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.image = UIImage(named: "Photo")
        avatar.layer.masksToBounds = true
        avatar.contentMode = .scaleAspectFill
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .darkGray
        label.text = NSLocalizedString("Your name", comment: "")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameTextField: CustomTextField = {
        let textField = CustomTextField(text: "", placeholder: "")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
        let textField = CustomTextField(text: "admin@mail.ru", placeholder: "example@mail.com")
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
    
    private lazy var roleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .darkGray
        label.text = NSLocalizedString("Role", comment: "")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var roleTextField: CustomTextField = {
        let textField = CustomTextField(text: "pet owner", placeholder: "")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var saveButton: CustomButton = {
        let button = CustomButton (title: NSLocalizedString("Save", comment: ""), titleColor: .white, backgroundColor: .CustomColor.buttonBlue)
        button.addTarget(self, action: #selector(save), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var userStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.addArrangedSubviews(nameLabel, nameTextField, emailLabel, emailTextField, passwordLabel, passwordTextField, roleLabel, roleTextField)
        stackView.distribution = .fillEqually
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
    
    @objc func save () {
//        saveAction?(userAvatar.image, nameTextField.)
    }
    
    @objc func openGallery () {
        openGalleryAction?()
    }
    
    func setImage (image: UIImage) {
        self.userAvatar.image = image
    }
    
    private func setupView() {
        let tap = UITapGestureRecognizer (target: self, action: #selector (openGallery))
        userAvatar.addGestureRecognizer(tap)
        addSubviews(userAvatar, userStackView, saveButton)
        
        NSLayoutConstraint.activate([
            userAvatar.widthAnchor.constraint(equalToConstant: 140),
            userAvatar.heightAnchor.constraint(equalToConstant: 140),
            userAvatar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            userAvatar.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            userStackView.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 32),
            userStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            userStackView.heightAnchor.constraint(equalToConstant: 360),
            
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            saveButton.heightAnchor.constraint(equalToConstant: 48),
            saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
