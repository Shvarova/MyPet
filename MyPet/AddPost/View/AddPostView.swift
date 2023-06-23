//
//  AddPostView.swift
//  MyPet
//
//  Created by Дина Шварова on 09.06.2023.
//

import UIKit

class AddPostView: UIView {
    
    var publishAction: ((UIImage?, String, String) ->())?
    var openGalleryAction: (() -> ())?
    
    lazy var image: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.image = UIImage(named: "Image")
        img.isUserInteractionEnabled = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        textField.textColor = .white
        textField.autocapitalizationType = .none
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1
//        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
//    private lazy var descriptionTextField: UITextField = {
//        let textField = UITextField()
//        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
//        textField.textColor = .white
//        textField.autocapitalizationType = .none
//        textField.layer.borderColor = UIColor.white.cgColor
//        textField.layer.borderWidth = 1
//       textField.delegate = self
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
    
    private lazy var descriptionText: UITextView = {
        let text = UITextView()
        text.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        text.textColor = .white
        text.backgroundColor = .clear
        text.layer.borderColor = UIColor.white.cgColor
        text.layer.borderWidth = 1
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var publishButton: CustomButton = {
        let button = CustomButton (title: NSLocalizedString("Publish", comment: ""), titleColor: .white, backgroundColor: .CustomColor.buttonBlue)
        button.addTarget(self, action: #selector(publish), for: .touchUpInside)
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
    
    @objc func publish () {
        publishAction?(image.image, titleTextField.text!, descriptionText.text!)
    }
    
    @objc func openGallery () {
        openGalleryAction?()
    }
    
    func setImage (image: UIImage) {
        self.image.image = image
    }
    
    private func setupView() {
        let tap = UITapGestureRecognizer (target: self, action: #selector (openGallery))
        image.addGestureRecognizer(tap)
        addSubviews(image, titleTextField, descriptionText, publishButton)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            image.heightAnchor.constraint(equalToConstant: 200),
            
            titleTextField.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descriptionText.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 16),
            descriptionText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionText.bottomAnchor.constraint(equalTo: publishButton.topAnchor, constant: -16),
            
            publishButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            publishButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            publishButton.heightAnchor.constraint(equalToConstant: 48),
            publishButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
