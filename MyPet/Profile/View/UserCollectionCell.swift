//
//  UserCollectionCell.swift
//  MyPet
//
//  Created by Дина Шварова on 05.06.2023.
//

import UIKit

class UserCollectionCell: UICollectionViewCell {
    
    static let id = "UserCollectionCell"
    
    private let userAvatar: UIImageView = {
        let avatar = UIImageView ()
        avatar.layer.cornerRadius = 70
        avatar.clipsToBounds = true
        avatar.layer.borderWidth = 0.5
        avatar.layer.masksToBounds = true
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.image = UIImage(named: "User avatar")
        avatar.layer.masksToBounds = true
        avatar.contentMode = .scaleAspectFill
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    private let nameLabel: UILabel = {
        let name = UILabel()
        name.textAlignment = .center
        name.textColor = .white
        name.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var roleLabel: UILabel = {
        let role = UILabel ()
        role.textAlignment = .center
        role.textColor = .CustomColor.neon
        role.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        role.translatesAutoresizingMaskIntoConstraints = false
        return role
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUser (user: UserData) {
        let userAvatarURL = URL(string: user.userAvatar)
        if let userAvatarURL = userAvatarURL {
            userAvatar.load(url: userAvatarURL)
        } else {
            userAvatar.image = UIImage(named: "User avatar")
        }
        nameLabel.text = user.userName
        roleLabel.text = user.role
    }
    
    private func setupView() {
        addSubviews(userAvatar, nameLabel, roleLabel)
        
        NSLayoutConstraint.activate([
            userAvatar.widthAnchor.constraint(equalToConstant: 140),
            userAvatar.heightAnchor.constraint(equalToConstant: 140),
            userAvatar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            userAvatar.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            roleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            roleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            roleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            roleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            roleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
