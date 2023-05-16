//
//  PostButton.swift
//  MyPet
//
//  Created by Дина Шварова on 12.05.2023.
//

import UIKit

enum Icon {
    case like
    case comment
}

class PostButton: UIView {
    
    var action: (() -> ())?
    
    private lazy var image: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.tintColor = .white
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var postStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.addArrangedSubviews(image, title)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init(image: Icon) {
        super.init(frame: .zero)
        setupButton(image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton (image: Icon) {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(buttonTapped))
        addGestureRecognizer(tap)
        
        switch image {
        case .like:
            self.image.image = UIImage(systemName: "heart.fill")
            self.image.tintColor = .CustomColor.like
        case .comment:
            self.image.image = UIImage(systemName: "message.fill")
            self.image.tintColor = .CustomColor.neon
        }
        
        layer.cornerRadius = 8
        backgroundColor = .CustomColor.backgroundLight
        clipsToBounds = true
        addSubview(postStackView)
        
        NSLayoutConstraint.activate([
            postStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            postStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            postStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            self.image.heightAnchor.constraint(equalToConstant: 16),
            self.image.widthAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    @objc private func buttonTapped() {
        action? ()
    }
    
    func setTitle (title: String) {
        self.title.text = title
    }
}
