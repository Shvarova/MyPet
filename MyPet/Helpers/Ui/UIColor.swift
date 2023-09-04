//
//  UIColor.swift
//  MyPet
//
//  Created by Дина Шварова on 02.09.2023.
//

import UIKit

extension UIColor {
    static func createColor(lightMode: UIColor, darkMode: UIColor) -> UIColor {
        return UIColor { (traitCollection) -> UIColor in
            return traitCollection.userInterfaceStyle == .light ? lightMode :
            darkMode
        }
    }
}
