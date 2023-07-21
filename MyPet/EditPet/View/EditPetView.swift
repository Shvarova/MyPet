//
//  EditPetView.swift
//  MyPet
//
//  Created by Дина Шварова on 28.06.2023.
//

import UIKit

class EditPetView: UIView {
    
    var saveAction: ((UIImage?, String, String) ->())?
    var openGalleryAction: (() -> ())?
    
    private let petAvatar: UIImageView = {
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
        label.text = NSLocalizedString("Pet name", comment: "")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameTextField: CustomTextField = {
        let textField = CustomTextField(text: "", placeholder: "")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var breedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .darkGray
        label.text = NSLocalizedString("Breed", comment: "")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var breedTextField: CustomTextField = {
        let textField = CustomTextField(text: "", placeholder: "")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
        
    private lazy var saveButton: CustomButton = {
        let button = CustomButton (title: NSLocalizedString("Save", comment: ""), titleColor: .white, backgroundColor: .CustomColor.buttonBlue)
//        button.addTarget(self, action: #selector(save), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    @objc func save () {
//        saveAction?(petAvatar.image, nameTextField.text!, breedTextField.text!)
//    }
    
    @objc func openGallery () {
        openGalleryAction?()
    }
    
    func setImage (image: UIImage) {
        self.petAvatar.image = image
    }
    
    private func setupView() {
        let tap = UITapGestureRecognizer (target: self, action: #selector (openGallery))
        petAvatar.addGestureRecognizer(tap)
        addSubviews(petAvatar, nameLabel, nameTextField, breedLabel, breedTextField, saveButton)
        
        NSLayoutConstraint.activate([
            petAvatar.widthAnchor.constraint(equalToConstant: 140),
            petAvatar.heightAnchor.constraint(equalToConstant: 140),
            petAvatar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            petAvatar.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: petAvatar.bottomAnchor, constant: 32),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameTextField.heightAnchor.constraint(equalToConstant: 32),
            nameTextField.bottomAnchor.constraint(equalTo: breedLabel.topAnchor, constant: -16),
            
            breedLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            breedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            breedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                        
            breedTextField.topAnchor.constraint(equalTo: breedLabel.bottomAnchor, constant: 8),
            breedTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            breedTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            breedTextField.heightAnchor.constraint(equalToConstant: 32),
//            breedTextField.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -16),
            
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            saveButton.heightAnchor.constraint(equalToConstant: 48),
            saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
