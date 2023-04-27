//
//  CustomButton.swift
//  MyPet
//
//  Created by Дина Шварова on 26.04.2023.
//

import UIKit

class CustomButton: UIButton {
    
    var action: (() -> ())?
    
    init(title: String, titleColor: UIColor, backgroundColor: UIColor) {
        super.init(frame: .zero)
        setupButton(title: title, titleColor: titleColor, backgroundColor: backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton (title: String, titleColor: UIColor, backgroundColor: UIColor) {
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        layer.cornerRadius = 24
        clipsToBounds = true
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        action? ()
    }
}

