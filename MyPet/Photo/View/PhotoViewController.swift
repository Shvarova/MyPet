//
//  PhotoViewController.swift
//  MyPet
//
//  Created by Дина Шварова on 16.05.2023.
//

import UIKit

class PhotoViewController: UIViewController {
    
    private var photos = Photos.photos
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.register(PhotosCell.self, forCellWithReuseIdentifier: "CustomCell")
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .createColor(lightMode: .white, darkMode: .CustomColor.backgroundDark)
        addViews()
        addConstraints()
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(named: "Back button"), style: .plain, target: self, action: #selector(back))
        backButton.tintColor = .createColor(lightMode: .CustomColor.backgroundDark, darkMode: .white)
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func back() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.tabBarController?.tabBar.isHidden = false
        navigationController?.popViewController(animated: true)
    }
    
    func addViews(){
        view.addSubview(collectionView)
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension PhotoViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? PhotosCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        cell.setup(with: "\(photos[indexPath.row])")
        return cell
    }
}

extension PhotoViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: PhotoConstans.itemSizeInPhotosCollection, height: PhotoConstans.itemSizeInPhotosCollection)
    }
}

