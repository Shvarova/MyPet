//
//  MyPostsCollectionCell.swift
//  MyPet
//
//  Created by Дина Шварова on 05.06.2023.
//

import UIKit

class MyPostsCollectionCell: UICollectionViewCell {
    
    static let id = "MyPostsCollectionCell"
    
    private let postLabel: UILabel = {
        let name = UILabel()
        name.textAlignment = .left
        name.text = NSLocalizedString("My post", comment: "")
        name.textColor = .lightGray
        name.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var plusImageView: UIImageView = {
        let plus = UIImageView()
        plus.image = UIImage(named: "Plus")
        plus.translatesAutoresizingMaskIntoConstraints = false
        return plus
    }()
    
//    private lazy var plusButton: UIButton = {
//        let button = UIButton ()
//        button.setBackgroundImage(UIImage (named: "Plus"), for: .normal)
//        button.addTarget(self, action: #selector(presentAddPostViewController), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()

    private lazy var bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    @objc private func presentAddPostViewController() {
//        addPostAction?()
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubviews(postLabel, plusImageView, bottomLine)
        
        NSLayoutConstraint.activate([
            postLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            postLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            postLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            postLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            
            plusImageView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            plusImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            plusImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            plusImageView.widthAnchor.constraint(equalToConstant: 24),
            plusImageView.heightAnchor.constraint(equalToConstant: 24),
            
            bottomLine.topAnchor.constraint(equalTo: postLabel.bottomAnchor, constant: 8),
            bottomLine.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            bottomLine.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            bottomLine.heightAnchor.constraint(equalToConstant: 1),
            bottomLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
