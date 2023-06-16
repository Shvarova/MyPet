//
//  AddPostView.swift
//  MyPet
//
//  Created by Дина Шварова on 09.06.2023.
//

import UIKit

class AddPostView: UIView {
    
    lazy var image: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        textField.textColor = .white
        textField.autocapitalizationType = .none
//        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.textColor = .white
        textField.autocapitalizationType = .none
//        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubviews(image, titleTextField, descriptionTextField)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 16),
            image.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.heightAnchor.constraint(equalToConstant: 200),
            
            titleTextField.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 16),
            descriptionTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
