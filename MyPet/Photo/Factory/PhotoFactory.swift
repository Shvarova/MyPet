//
//  PhotoFactory.swift
//  MyPet
//
//  Created by Дина Шварова on 16.06.2023.
//

import UIKit

enum PhotoFactory {
    static func getViewControlller () -> UIViewController {
        let vc = PhotoViewController()
        return vc
    }
}
