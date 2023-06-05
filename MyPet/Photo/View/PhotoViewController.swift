//
//  PhotoViewController.swift
//  MyPet
//
//  Created by Дина Шварова on 16.05.2023.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private let model = PhotoViewModel()
    
    private lazy var layout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            return layout
        }()

        private lazy var collectionView: UICollectionView = {
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
            collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            return collectionView
        }()

        override func viewDidLoad() {
            super.viewDidLoad()
            navigationController?.navigationBar.isHidden = false
            title = "Photo Gallery"
            view.backgroundColor = .white
            addViews()
            addConstraints()
        }

        func addViews(){
            view.addSubview(collectionView)
        }

        func addConstraints(){
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
                collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
                collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
                collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
        }
    }

    extension PhotosViewController : UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 20
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? PhotosCollectionViewCell else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
            cell.setup(with: "\(model.photos[indexPath.row])")
            return cell
        }
    }

    extension PhotosViewController : UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: PhotoConstans.itemSizeInPhotosCollection, height: PhotoConstans.itemSizeInPhotosCollection)
        }
    }

