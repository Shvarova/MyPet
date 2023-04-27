//
//  AuthView.swift
//  MyPet
//
//  Created by Дина Шварова on 26.04.2023.
//

import UIKit

class AuthView: UIView {
    
    private lazy var topImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Group1"))
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var rightImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Group2"))
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var leftImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Element1"))
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .CustomColor.emphasis
        label.text = NSLocalizedString("love brings us together 🙌", comment: "")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .white
        label.text = NSLocalizedString("social network for pet owners, vets, breeders and clubs", comment: "")
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textView: UITextView = {
        let text = UITextView(frame: .zero)
        text.font = UIFont.systemFont(ofSize: 40, weight: .regular)
        text.textColor = .white
        text.contentMode = .center
        text.showsVerticalScrollIndicator = false
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isEditable = false
        return text
    }()
    
    private lazy var logInButton: CustomButton = {
        let button = CustomButton(title: NSLocalizedString("Log In", comment: ""), titleColor: .white, backgroundColor: .clear)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.CustomColor.buttonBlue.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var signUpButton: CustomButton = {
        let button = CustomButton (title: NSLocalizedString("Sign Up", comment: ""), titleColor: .white, backgroundColor: .CustomColor.buttonBlue)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.addArrangedSubviews(logInButton, signUpButton)
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
    
    private func setupView() {
        addSubviews(topImageView, leftImageView, rightImageView, titleLabel, textLabel, buttonsStackView)
        
        NSLayoutConstraint.activate([
            topImageView.topAnchor.constraint(equalTo: topAnchor, constant: 48),
            topImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            rightImageView.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: -24),
            rightImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            leftImageView.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: 48),
            leftImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            titleLabel.bottomAnchor.constraint(equalTo: textLabel.topAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            textLabel.bottomAnchor.constraint(equalTo: buttonsStackView.topAnchor, constant: -32),
            
            buttonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            buttonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            buttonsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -56),
            
            logInButton.heightAnchor.constraint(equalToConstant: 48),
            signUpButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
