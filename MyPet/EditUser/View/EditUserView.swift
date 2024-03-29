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
        avatar.layer.borderColor = UIColor.lightGray.cgColor
        avatar.image = UIImage(named: "Photo")
        avatar.layer.masksToBounds = true
        avatar.contentMode = .scaleAspectFill
        avatar.isUserInteractionEnabled = true
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.text = Labels.Edit.nameLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameTextField: CustomTextField = {
        let textField = CustomTextField(text: "", placeholder: "")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //MARK: пока не умею менять учетку пользователя в firebase
    
//    private lazy var emailLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 16)
//        label.textColor = .darkGray
//        label.text = NSLocalizedString("Your email", comment: "")
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var emailTextField: CustomTextField = {
//        let textField = CustomTextField(text: "", placeholder: "example@mail.com")
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//
//    private lazy var passwordLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 16)
//        label.textColor = .darkGray
//        label.text = NSLocalizedString("Your password", comment: "")
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var passwordTextField: CustomTextField = {
//        let textField = CustomTextField(text: "", placeholder: "Password")
//        textField.isSecureTextEntry = true
//        textField.isUserInteractionEnabled = false
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
    
    private lazy var roleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.text = Labels.Edit.roleLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var roleTextField: CustomTextField = {
        let textField = CustomTextField(text: "", placeholder: "")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var saveButton: CustomButton = {
        let button = CustomButton (title: (Labels.Edit.saveButton), titleColor: .white, backgroundColor: .CustomColor.buttonBlue)
        button.addTarget(self, action: #selector(save), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var userStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.addArrangedSubviews(nameLabel, nameTextField, roleLabel, roleTextField)
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
        let userImageAvatar: UIImage?
        if userAvatar.image == UIImage(named: "Photo") {
            userImageAvatar = nil
        } else {
            userImageAvatar = userAvatar.image
        }
        saveAction?(userImageAvatar, nameTextField.getText(), roleTextField.getText())
    }
    
    @objc func openGallery () {
        openGalleryAction?()
    }
    
    func setImage (image: UIImage) {
        self.userAvatar.image = image
    }
    
    func setUserData(userData: UserData) {
        let userAvatarURL = URL(string: userData.userAvatar)
        if let userAvatarURL = userAvatarURL {
            userAvatar.load(url: userAvatarURL)
        } else {
            userAvatar.image = UIImage(named: "Photo")
        }
        nameTextField.setText(text: userData.userName)
        roleTextField.setText(text: userData.role)
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
            userStackView.heightAnchor.constraint(equalToConstant: 160),
            
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            saveButton.heightAnchor.constraint(equalToConstant: 48),
            saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
