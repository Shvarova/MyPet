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
    
    var update: (([PostData]) -> ())?
    
    var posts: [PostData] {
        DataManager.shared.allPosts
    }
    
    func startUpdate (state: HomeState) {
        switch state {
        case .willAppear: update?(posts)
        case .filter(let title): update?(getPosts(with: title))
        }
    }
    
    func updateLikes(posts: [PostData]) {
        for value in 0...(posts.count - 1) {
            if self.posts[value].like != posts[value].like {
                DataManager.shared.saveLikedPost(postID: posts[value].id, likesCount: posts[value].like)
            }
        }
    }
    
    func presentSearchController (delegate: HomeViewControllerDelegate) {
        output?.presentSearchController(delegate: delegate)
    }
    
    private func getPosts(with title: String) -> [PostData] {
        if title.isEmpty {return posts}
        return posts.filter { post in
            return post.title.lowercased().contains(title.lowercased())
        }
    }
}

