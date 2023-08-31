//
//  String.swift
//  MyPet
//
//  Created by Дина Шварова on 20.08.2023.
//

import Foundation

extension String {
    
    func passwordIsValid() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: self)
    }
}
