//
//  MyPhotosCollectionCell.swift
//  MyPet
//
//  Created by Дина Шварова on 05.06.2023.
//

import UIKit

class MyPhotosCollectionCell: UICollectionViewCell {
    
    static let id = "MyPhotosCollectionCell"
    private var photos: [Photos] = []
    private var cellsCount = 2
    
    
    private let photoLabel: UILabel = {
        let name = UILabel()
        name.textAlignment = .left
        name.text = NSLocalizedString("My photos", comment: "")
        name.textColor = .lightGray
        name.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let plus = UIImageView()
        plus.image = UIImage(named: "Arrow right")
        plus.translatesAutoresizingMaskIntoConstraints = false
        return plus
    }()
    
//    private lazy var arrowButton: UIButton = {
//        let button = UIButton ()
//        button.setBackgroundImage(UIImage (named: "Arrow right"), for: .normal)
//        button.addTarget(self, action: #selector(presentPhotosViewController), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    private lazy var bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        view.register(PhotosCell.self, forCellWithReuseIdentifier: "PhotosCell")
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        view.backgroundColor = .CustomColor.backgroundDark
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 48) / 2, height: 140)
        return layout
    }()
    
//    @objc private func presentPhotosViewController() {
//        openPhotoGalleryAction?()
//    }
    
    func setPhotos (photos: [Photos]) {
        self.photos = photos
        cellsCount = photos.count
        collectionView.reloadData()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubviews(photoLabel, arrowImageView, bottomLine, collectionView)
        
        NSLayoutConstraint.activate([
            photoLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            photoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            photoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            
            arrowImageView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowImageView.widthAnchor.constraint(equalToConstant: 24),
            arrowImageView.heightAnchor.constraint(equalToConstant: 24),
            
            bottomLine.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 8),
            bottomLine.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            bottomLine.heightAnchor.constraint(equalToConstant: 1),
            bottomLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 140),
            collectionView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}

extension MyPhotosCollectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCell", for: indexPath) as? PhotosCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        cell.setup(with: "\(photos[indexPath.row])")
        return cell
    }
}

extension MyPhotosCollectionCell: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: (UIScreen.main.bounds.width - 48) / 2, height: 140)
//    }
}
