//
//  PostCell.swift
//  MyPet
//
//  Created by Дина Шварова on 12.05.2023.
//

import UIKit

class PostCell: UICollectionViewCell {
    
    static let id = "PostCell"
    
    var doubleTapAction: (() -> ())?
    private var likes: Int = 0 {
        didSet {
            likeButton.setTitle(title: "\(likes)")
        }
    }
    
    lazy var authorAvatar: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 16
        img.layer.borderWidth = 0.5
        img.layer.masksToBounds = true
        img.layer.borderColor = UIColor.lightGray.cgColor
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.textColor = .createColor(lightMode: .CustomColor.backgroundDark, darkMode: .white)
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var date: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .createColor(lightMode: .CustomColor.backgroundDark, darkMode: .white)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .createColor(lightMode: .CustomColor.backgroundDark, darkMode: .white)
        label.numberOfLines = 8
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var image: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var likeButton: PostButton = {
        let button = PostButton(image: .like)
//        button.addTarget(self, action: #selector(), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    lazy var commentButton: PostButton = {
//        let button = PostButton(image: .comment)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cleanData()
    }
    
    func setPost (post: PostData) {
         if let imageURL = URL(string: post.authorAvatar) {
            self.authorAvatar.load(url: imageURL)
        } else {
            authorAvatar.image = UIImage(named: "User avatar")
        }
        name.text = post.authorName
        date.text = post.date
        titleLabel.text = post.title
        descriptionLabel.text = post.postDescription
        if let image = post.image,
           let imageURL = URL(string: image) {
            self.image.load(url: imageURL)
        }
        likes = post.like
//        commentButton.setTitle(title: String(post.comment))
    }
    
    private func addDoubleTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        tap.numberOfTapsRequired = 2
        addGestureRecognizer(tap)
    }
    
    @objc private func doubleTap() {
        doubleTapAction?()
        likes += 1
    }
    
    private func cleanData() {
        authorAvatar.image = nil
        name.text = ""
        date.text = ""
        titleLabel.text = ""
        descriptionLabel.text = ""
        likeButton.setTitle(title: "0")
        image.image = nil
    }
    
    private func setupView() {
        addDoubleTap()
        addSubviews(authorAvatar, name, date, titleLabel, descriptionLabel, image, likeButton)
        
        NSLayoutConstraint.activate([
            authorAvatar.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            authorAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            authorAvatar.heightAnchor.constraint(equalToConstant: 32),
            authorAvatar.widthAnchor.constraint(equalToConstant: 32),
            
            name.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            name.leadingAnchor.constraint(equalTo: authorAvatar.trailingAnchor, constant: 8),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            date.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 4),
            date.leadingAnchor.constraint(equalTo: authorAvatar.trailingAnchor, constant: 8),
            
            titleLabel.topAnchor.constraint(equalTo: authorAvatar.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            image.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            image.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.heightAnchor.constraint(equalToConstant: 200),
            
            likeButton.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            likeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            likeButton.heightAnchor.constraint(equalToConstant: 32),
            likeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24)
            
//            commentButton.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
//            commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 8),
//            commentButton.heightAnchor.constraint(equalToConstant: 32),
//            commentButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24)
        ])
    }
}
