//
//  ProfileView.swift
//  MyPet
//
//  Created by Дина Шварова on 28.04.2023.
//

import UIKit

class ProfileView: UIView {
    
    var editPetAction: (() -> ())?
    var openPhotoGalleryAction: (() -> ())?
    var addPostAction: (() -> ())?
    
    private var user = UserData(id: "", userAvatar: "", userName: "", petID: "", email: "", role: "")
    private var pet = PetData(id: "", petAvatar: "", petName: "", breed: "")
    private var posts: [PostData] = []
    private var cellsCount = 4
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel ()
        title.text = "Profile"
        title.font = .boldSystemFont(ofSize: 24)
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        view.register(PostCell.self, forCellWithReuseIdentifier: "PostCell")
        view.register(UserCollectionCell.self, forCellWithReuseIdentifier: UserCollectionCell.id)
        view.register(PetCollectionCell.self, forCellWithReuseIdentifier: PetCollectionCell.id)
        view.register(MyPhotosCollectionCell.self, forCellWithReuseIdentifier: MyPhotosCollectionCell.id)
        view.register(MyPostsCollectionCell.self, forCellWithReuseIdentifier: MyPostsCollectionCell.id)
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        view.backgroundColor = .CustomColor.backgroundDark
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return layout
    }()
    
    func setUser (user: UserData) {
        self.user = user
        collectionView.reloadData()
    }
    
    func setPet (pet: PetData) {
        self.pet = pet
        collectionView.reloadData()
    }
    
    func setPosts (posts: [PostData]) {
        self.posts = posts
        cellsCount = 4 + posts.count
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
        addSubviews(titleLabel, collectionView)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
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
        case 0: guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionCell.id, for: indexPath) as? UserCollectionCell else {
            return cell
        }
            cell.setUser(user: user)
            return cell
        case 1: cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetCollectionCell.id, for: indexPath)
        case 2: cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPhotosCollectionCell.id, for: indexPath)
        case 3: cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPostsCollectionCell.id, for: indexPath)
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCell.id, for: indexPath) as? PostCell  else {
                return cell
            }
            cell.setPost(post: posts [indexPath.row - 4])
            return cell
        }
        return cell
    }
}

extension ProfileView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1: editPetAction?()
        case 2: openPhotoGalleryAction?()
        case 3: addPostAction?()
        default: break
        }
    }
}
