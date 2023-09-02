//
//  HomeView.swift
//  MyPet
//
//  Created by Дина Шварова on 29.04.2023.
//

import UIKit

class HomeView: UIView {
    
    var searchAction: (() -> ())?
    var resetAction: (() -> ())?
    
    private var posts = [PostData]()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton ()
        button.setBackgroundImage(UIImage (systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(presentSearchViewController), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton ()
        button.setBackgroundImage(UIImage (systemName: "multiply"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(reset), for: .touchUpInside)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel ()
        title.text = Labels.Home.title
        title.font = .boldSystemFont(ofSize: 24)
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        view.register(PostCell.self, forCellWithReuseIdentifier: "PostCell")
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        view.backgroundColor = .CustomColor.backgroundDark
        view.dataSource = self
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
    
    @objc private func presentSearchViewController() {
        searchAction?()
    }
    
    @objc private func reset() {
        resetAction?()
    }
    
    private func setupView() {
        addSubviews(searchButton, resetButton, titleLabel, collectionView)
        
        NSLayoutConstraint.activate([
            searchButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            searchButton.widthAnchor.constraint(equalToConstant: 28),
            searchButton.heightAnchor.constraint(equalToConstant: 28),
            
            resetButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            resetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            resetButton.widthAnchor.constraint(equalToConstant: 28),
            resetButton.heightAnchor.constraint(equalToConstant: 28),

            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setPosts (posts: [PostData]) {
        self.posts = posts
        collectionView.reloadData()
    }
    
    func showResetButton() {
        searchButton.isHidden = true
        resetButton.isHidden = false
    }
    
    func showSearchButton() {
        searchButton.isHidden = false
        resetButton.isHidden = true
    }
}

extension HomeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as? PostCell
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        cell.setPost(post: posts[indexPath.row])
        cell.doubleTapAction = {
            
        }
        return cell
    }
}
