//
//  String.swift
//  MyPet
//
//  Created by Дина Шварова on 01.09.2023.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
