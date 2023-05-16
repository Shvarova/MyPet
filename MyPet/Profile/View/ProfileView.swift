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
        name.text = "Admin's very long name"
        name.textColor = .white
        name.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var emailLabel: UILabel = {
        let email = UILabel ()
        email.textAlignment = .center
        email.textColor = .CustomColor.neon
        email.text = "admin@mail.com"
        email.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    private let petLabel: UILabel = {
        let name = UILabel()
        name.textAlignment = .left
        name.text = "My pet"
        name.textColor = .lightGray
        name.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var petView: PetView = {
        let pet = PetView()
        pet.layer.cornerRadius = 16
        pet.clipsToBounds = true
        pet.backgroundColor = .CustomColor.backgroundLight
        pet.translatesAutoresizingMaskIntoConstraints = false
        return pet
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
        addSubviews(userAvatar, nameLabel, emailLabel, petLabel, petView)
        
        NSLayoutConstraint.activate([
            userAvatar.widthAnchor.constraint(equalToConstant: 140),
            userAvatar.heightAnchor.constraint(equalToConstant: 140),
            userAvatar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            userAvatar.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            petLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            petLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            petLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 24),
            
            petView.topAnchor.constraint(equalTo: petLabel.bottomAnchor, constant: 8),
            petView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            petView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            petView.heightAnchor.constraint(equalToConstant: 72)
        ])        
    }
}
