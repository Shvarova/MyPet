//
//  Colors.swift
//  MyPet
//
//  Created by Дина Шварова on 26.04.2023.
//

import UIKit

extension UIColor {
    enum CustomColor {
        static let buttonBlue = UIColor(named: "ButtonBlue") ?? .systemBlue
        static let emphasis = UIColor(named: "Emphasis") ?? .systemPurple
        static let like = UIColor(named: "Like") ?? .systemOrange
        static let backgroundDark = UIColor(named: "BackgroundDark") ?? .black
        static let backgroundLight = UIColor(named: "BackgroundLight") ?? .darkGray
    }
}
