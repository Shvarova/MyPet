//
//  PostCell.swift
//  MyPet
//
//  Created by Дина Шварова on 12.05.2023.
//

import UIKit

class PostCell: UICollectionViewCell {
    
    private lazy var authorAvatar: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 16
        img.layer.borderWidth = 0.5
        img.layer.masksToBounds = true
        img.layer.borderColor = UIColor.white.cgColor
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var name: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var date: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateFormatter: DateFormatter = {
        let date = DateFormatter()
        date.dateFormat = "dd.MM.yy"
        return date
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var image: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var likeButton: PostButton = {
        let button = PostButton(image: .like)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var commentButton: PostButton = {
        let button = PostButton(image: .comment)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPost (post: Post) {
        authorAvatar.image = UIImage(named: post.authorAvatar)
        name.text = post.authorName
        date.text = dateFormatter.string(from: post.date)
        titleLabel.text = post.title
        subtitleLabel.text = post.subtitle
        image.image = UIImage(named: post.image)
        likeButton.setTitle(title: String(post.like))
        commentButton.setTitle(title: String(post.comment))
    }
    
    private func setupView() {
        addSubviews(authorAvatar, name, date, titleLabel, subtitleLabel, image, likeButton, commentButton)
        
        NSLayoutConstraint.activate([
            authorAvatar.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            authorAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            authorAvatar.heightAnchor.constraint(equalToConstant: 32),
            authorAvatar.widthAnchor.constraint(equalToConstant: 32),
            
            name.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            name.leadingAnchor.constraint(equalTo: authorAvatar.trailingAnchor, constant: 8),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            date.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 4),
            date.leadingAnchor.constraint(equalTo: authorAvatar.trailingAnchor, constant: 8),
            
            titleLabel.topAnchor.constraint(equalTo: authorAvatar.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            image.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 8),
            image.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.heightAnchor.constraint(equalToConstant: 200),
            
            likeButton.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            likeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            likeButton.heightAnchor.constraint(equalToConstant: 32),
            
            commentButton.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 8),
            commentButton.heightAnchor.constraint(equalToConstant: 32),
            commentButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24)
        ])
    }
}
