//
//  CustomButton.swift
//  MyPet
//
//  Created by Дина Шварова on 26.04.2023.
//

import UIKit

class CustomButton: UIButton {
    
    var action: (() -> ())?
    
    init(title: String, titleColor: UIColor, backgroundColor: UIColor, cornerRadius: CGFloat = 24) {
        super.init(frame: .zero)
        setupButton(title: title, titleColor: titleColor, backgroundColor: backgroundColor, cornerRadius: cornerRadius)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton (title: String, titleColor: UIColor, backgroundColor: UIColor, cornerRadius: CGFloat) {
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        action? ()
    }
}

