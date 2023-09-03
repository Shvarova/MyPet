//
//  AddPostView.swift
//  MyPet
//
//  Created by Дина Шварова on 09.06.2023.
//

import UIKit

class AddPostView: UIView, UITextViewDelegate {
    
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
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.text = Labels.Post.titleLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleTextField: CustomTextField = {
        let textField = CustomTextField(text: "", placeholder: "")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.text = Labels.Post.descriptionLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionText: UITextView = {
        let text = UITextView()
        text.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        text.textColor = .createColor(lightMode: .CustomColor.backgroundDark, darkMode: .white)
        text.backgroundColor = .clear
        text.layer.borderColor = UIColor.darkGray.cgColor
        text.layer.borderWidth = 1
        text.textContainerInset = UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
        text.delegate = self
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var descriptionCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var publishButton: CustomButton = {
        let button = CustomButton (title: (Labels.Post.publishButton), titleColor: .white, backgroundColor: .CustomColor.buttonBlue)
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
        publishAction?(image.image, titleTextField.getText(), descriptionText.text ?? "")
    }
    
    @objc func openGallery () {
        openGalleryAction?()
    }

    func textViewDidChange(_ textView: UITextView) {
        self.updateCharacterCount()
     }
    
    func setImage (image: UIImage) {
        self.image.image = image
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return self.textLimit(existingText: textView.text, newText: text, limit: 280)
    }
    
    private func textLimit(existingText: String?, newText: String, limit: Int) -> Bool {
        let text = existingText ?? ""
        let isAtLimit = text.count + newText.count <= limit
        return isAtLimit
    }
    
    private func updateCharacterCount() {
        let descriptionCount = self.descriptionText.text.count
        self.descriptionCountLabel.text = "\((0) + descriptionCount)/280"
     }
    
    private func setupView() {
        let tap = UITapGestureRecognizer (target: self, action: #selector (openGallery))
        image.addGestureRecognizer(tap)
        addSubviews(image, titleLabel, titleTextField, descriptionLabel, descriptionText, descriptionCountLabel, publishButton)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            image.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleTextField.heightAnchor.constraint(equalToConstant: 32),
            titleTextField.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                        
            descriptionText.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            descriptionText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionText.heightAnchor.constraint(equalToConstant: 150),
            
            descriptionCountLabel.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 8),
            descriptionCountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionCountLabel.heightAnchor.constraint(equalToConstant: 24),
            
            publishButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            publishButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            publishButton.heightAnchor.constraint(equalToConstant: 48),
            publishButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
