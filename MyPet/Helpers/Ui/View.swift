//
//  View.swift
//  MyPet
//
//  Created by Дина Шварова on 26.04.2023.
//

import UIKit

extension UIView {
    func addSubviews (_ subViews: UIView ...) {
        subViews.forEach { view in
            addSubview(view)
        }
    }
}
