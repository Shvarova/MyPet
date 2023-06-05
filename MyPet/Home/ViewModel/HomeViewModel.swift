//
//  HomeViewModel.swift
//  MyPet
//
//  Created by Дина Шварова on 29.04.2023.
//

import UIKit

enum HomeState {
    case willAppear
    case filter (String)
}

class HomeViewModel {
    var output: HomeOutput?
    
    var update: (([Post]) -> ())?
    
    private var posts = Posts().posts
    
    func startUpdate (state: HomeState) {
        switch state {
        case .willAppear: update?(posts)
        case .filter(let title): update?(getPosts(with: title))
        }
    }
    
    func presentSearchController (delegate: HomeViewControllerDelegate) {
        output?.presentSearchController(delegate: delegate)
    }
    
    private func getPosts(with title: String) -> [Post] {
        if title.isEmpty {return posts}
        return posts.filter { post in
            return post.title.lowercased().contains(title.lowercased())
        }
    }
}

