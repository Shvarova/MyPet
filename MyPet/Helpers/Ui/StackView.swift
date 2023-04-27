//
//  StackView.swift
//  MyPet
//
//  Created by Дина Шварова on 26.04.2023.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView ...) {
        views.forEach {
            addArrangedSubview($0)
        }
    }
}
