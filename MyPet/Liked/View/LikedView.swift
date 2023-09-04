//
//  LikedView.swift
//  MyPet
//
//  Created by Дина Шварова on 28.04.2023.
//

import UIKit

class LikedView: UIView {
    
    private var posts = [PostData]()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel ()
        title.text = Labels.Liked.titleLabel
        title.font = .boldSystemFont(ofSize: 24)
        title.textColor = .createColor(lightMode: .CustomColor.backgroundDark, darkMode: .white)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        view.register(PostCell.self, forCellWithReuseIdentifier: "PostCell")
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        view.backgroundColor = .createColor(lightMode: .white, darkMode: .CustomColor.backgroundDark)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.sectionInset = UIEdgeInsets(top: 24, left: 0, bottom: 24, right: 0)
        return layout
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPosts (posts: [PostData]) {
        self.posts = posts
        collectionView.reloadData()
    }
    
    private func setupView() {
        addSubviews(titleLabel, collectionView)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
