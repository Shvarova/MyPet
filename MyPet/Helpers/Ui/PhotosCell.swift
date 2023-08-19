//
//  PhotosCell.swift
//  MyPet
//
//  Created by Дина Шварова on 05.06.2023.
//

import UIKit

class PhotosCell : UICollectionViewCell {

    private lazy var photo: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with name: String) {
        photo.image = UIImage(named: name)
    }

    func setCornerRadius() {
        photo.layer.cornerRadius = 6
    }
    private func setupView() {
        addSubview(photo)
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: self.topAnchor),
            photo.leftAnchor.constraint(equalTo: self.leftAnchor),
            photo.rightAnchor.constraint(equalTo: self.rightAnchor),
            photo.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

