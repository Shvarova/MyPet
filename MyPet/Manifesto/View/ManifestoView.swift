//
//  ManifestoView.swift
//  MyPet
//
//  Created by Дина Шварова on 20.08.2023.
//

import UIKit

class ManifestoView: UIView {
    
    private lazy var topImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Logo"))
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .createColor(lightMode: .CustomColor.backgroundDark, darkMode: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textView: UITextView = {
        let text = UITextView(frame: .zero)
        text.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        text.backgroundColor = .createColor(lightMode: .white, darkMode: .CustomColor.backgroundDark)
        text.textColor = .createColor(lightMode: .CustomColor.backgroundDark, darkMode: .white)
        text.contentMode = .center
        text.showsVerticalScrollIndicator = false
        text.showsHorizontalScrollIndicator = false
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isEditable = false
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        titleLabel.text = Labels.Manifesto.title
        textView.text = Labels.Manifesto.text
    }
    
    private func setupView() {
        
        addSubviews(topImageView, titleLabel, textView)
        
        NSLayoutConstraint.activate([
            topImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            topImageView.heightAnchor.constraint(equalToConstant: 135),
            topImageView.widthAnchor.constraint(equalToConstant: 191),
            
            titleLabel.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
}
