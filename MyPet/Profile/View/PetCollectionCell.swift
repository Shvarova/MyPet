//
//  PetCollectionCell.swift
//  MyPet
//
//  Created by Дина Шварова on 05.06.2023.
//

import UIKit

class PetCollectionCell: UICollectionViewCell {
    
    static let id = "PetCollectionCell"
    
    private let petLabel: UILabel = {
        let name = UILabel()
        name.textAlignment = .left
        name.text = Labels.Profile.petLabel
        name.textColor = .lightGray
        name.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var petView: PetView = {
        let pet = PetView()
        pet.layer.cornerRadius = 16
        pet.clipsToBounds = true
        pet.backgroundColor = .createColor(lightMode: .systemGray5, darkMode: .CustomColor.backgroundLight) 
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
    
    func setPet(pet: PetData) {
        petView.setPet(pet: pet)
    }
    
    private func setupView() {
        addSubviews(petLabel, petView)
        
        NSLayoutConstraint.activate([
            petLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            petLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            petLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            
            petView.topAnchor.constraint(equalTo: petLabel.bottomAnchor, constant: 8),
            petView.bottomAnchor.constraint(equalTo: bottomAnchor),
            petView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            petView.trailingAnchor.constraint(equalTo: trailingAnchor),
            petView.leadingAnchor.constraint(equalTo: leadingAnchor),
            petView.heightAnchor.constraint(equalToConstant: 72)
        ])
    }
}
