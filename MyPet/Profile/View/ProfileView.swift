//
//  ProfileView.swift
//  MyPet
//
//  Created by Дина Шварова on 28.04.2023.
//

import UIKit

class ProfileView: UIView {
    
    private var posts: [Post] = []
    private var cellsCount = 2
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        view.register(PostCell.self, forCellWithReuseIdentifier: "PostCell")
        view.register(UserCollectionCell.self, forCellWithReuseIdentifier: UserCollectionCell.id)
        view.register(PetCollectionCell.self, forCellWithReuseIdentifier: PetCollectionCell.id)
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        view.backgroundColor = .CustomColor.backgroundDark
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return layout
    }()
    
    func setPosts (posts: [Post]) {
        self.posts = posts
        cellsCount = 2 + posts.count
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
        addSubviews(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])        
    }
}

extension ProfileView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
        switch indexPath.row {
        case 0: cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionCell.id, for: indexPath)
        case 1: cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetCollectionCell.id, for: indexPath)
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCell.id, for: indexPath) as? PostCell  else {
                return cell
            }
            cell.setPost(post: posts [indexPath.row - 2])
            return cell
        }
        return cell
    }
}
