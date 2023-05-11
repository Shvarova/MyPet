//
//  ProfileView.swift
//  MyPet
//
//  Created by Дина Шварова on 28.04.2023.
//

import UIKit

class ProfileView: UIView {
    
    private let userAvatar: UIImageView = {
        let avatar = UIImageView ()
        avatar.layer.cornerRadius = 60
        avatar.layer.masksToBounds = true
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    private let nameLabel: UILabel = {
        let name = UILabel()
        name.textAlignment = .center
        name.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var emailLabel: UILabel = {
        let email = UILabel ()
        email.textAlignment = .center
        email.textColor = .CustomColor.neon
        email.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    private let petLabel: UILabel = {
        let name = UILabel()
        name.textAlignment = .left
        name.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let petAvatar: UIImageView = {
        let avatar = UIImageView ()
        avatar.layer.cornerRadius = 60
        avatar.layer.masksToBounds = true
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    private let  petNameLabel: UILabel = {
        let name = UILabel()
        name.textAlignment = .left
        name.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var breedLabel: UILabel = {
        let email = UILabel ()
        email.textAlignment = .left
        email.textColor = .systemGray
        email.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    private lazy var petButton: UIButton = {
        let button = UIButton()
        button.frame.size = CGSize(width: 40.0, height: 40.0)
        button.layer.cornerRadius = 24
        button.backgroundColor = .CustomColor.buttonBlue
        button.setImage(UIImage(named: "Edit"), for: .normal)
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
    
//    func addInfoUser (user: User) {
//        nameLabel.text = user.name
//        userAvatar.image = user.avatar
//        statusLabel.text = user.status
//    }
    
    func setupView() {
        addSubviews(userAvatar, nameLabel, emailLabel, petLabel, petAvatar, petNameLabel, petButton)
        
        NSLayoutConstraint.activate([
            userAvatar.widthAnchor.constraint(equalToConstant: 140),
            userAvatar.heightAnchor.constraint(equalToConstant: 140),
            userAvatar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            userAvatar.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            petLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            petLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            petLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 16),
        ])        
    }
}
