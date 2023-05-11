//
//  ManifestoViewController.swift
//  MyPet
//
//  Created by Дина Шварова on 28.04.2023.
//

import UIKit

final class ManifestoViewController: UIViewController {
    
    let dataSourse = TextModel()
    
    private lazy var topImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Logo"))
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textView: UITextView = {
        let text = UITextView(frame: .zero)
        text.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        text.backgroundColor = .CustomColor.backgroundDark
        text.textColor = .white
        text.contentMode = .center
        text.showsVerticalScrollIndicator = false
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isEditable = false
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .CustomColor.backgroundDark
    }
    
    private func setupUI() {
        setupNavBar()
        setupViews()
        setupConstraints()
        titleLabel.text = "Our manifesto"
        textView.text = dataSourse.manifestoText
    }
    
    private func setupNavBar() {
        
        navigationController?.navigationBar.backgroundColor = .CustomColor.backgroundDark
        
        let appearance = UINavigationBarAppearance()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.title = "Manifesto"
    }
    
    private func setupViews() {
        view.addSubviews(topImageView, titleLabel, textView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            topImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            topImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
}


