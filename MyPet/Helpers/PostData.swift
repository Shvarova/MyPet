//
//  PostData.swift
//  MyPet
//
//  Created by Дина Шварова on 13.05.2023.
//

import UIKit

struct PostData: Equatable {
    let id: String
    let userID: String
    let authorAvatar: String
    let authorName: String
    let date: String
    let title: String
    let postDescription: String
    let image: String?
    var like: Int
    var comment: Int
}

