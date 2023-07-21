//
//  PetView.swift
//  MyPet
//
//  Created by Дина Шварова on 16.05.2023.
//

import UIKit

class PetView: UIView {
    
//    var editPetAction: (() -> ())?
    
    private let petAvatar: UIImageView = {
        let avatar = UIImageView ()
        avatar.layer.cornerRadius = 20
        avatar.image = UIImage(named: "Pet avatar")
        avatar.contentMode = .scaleAspectFill
        avatar.layer.borderWidth = 0.5
        avatar.layer.masksToBounds = true
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.masksToBounds = true
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    private let  petNameLabel: UILabel = {
        let name = UILabel()
        name.textAlignment = .left
        name.text = "Java"
        name.textColor = .white
        name.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var breedLabel: UILabel = {
        let breed = UILabel ()
        breed.textAlignment = .left
        breed.textColor = .systemGray
        breed.text = "Cat"
        breed.textColor = .lightGray
        breed.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        breed.translatesAutoresizingMaskIntoConstraints = false
        return breed
    }()
    
    private lazy var petButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.backgroundColor = .CustomColor.buttonBlue
        button.setImage(UIImage(named: "Edit"), for: .normal)
 //       button.addTarget(self, action: #selector(editPetClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    @objc func editPetClicked() {
//        editPetAction?()
//        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubviews(petAvatar, petNameLabel, breedLabel, petButton)
        
        NSLayoutConstraint.activate([
            petAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            petAvatar.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            petAvatar.heightAnchor.constraint(equalToConstant: 40),
            petAvatar.widthAnchor.constraint(equalToConstant: 40),
            
            petNameLabel.leadingAnchor.constraint(equalTo: petAvatar.trailingAnchor, constant: 16),
            petNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            petNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            
            breedLabel.leadingAnchor.constraint(equalTo: petAvatar.trailingAnchor, constant: 16),
            breedLabel.topAnchor.constraint(equalTo: petNameLabel.bottomAnchor, constant: 4),
            breedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
        
            petButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            petButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            petButton.heightAnchor.constraint(equalToConstant: 40),
            petButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}
