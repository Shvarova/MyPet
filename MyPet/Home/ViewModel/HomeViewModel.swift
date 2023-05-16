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
    
    private var posts = [Post(authorAvatar: "Admin avatar", authorName: "my pet", date: Date(), title: "Welcome to our social network!", subtitle: "We can't wait for you to share your experiences and connect with others who share your love! Please read our community guidelines carefully before posting or interacting with others. We're committed to maintaining a interesting and welcoming space for everyone. To ensure that everyone has a positive experience, we ask that you follow these guidelines: #Be respectful. Treat others as you would like to be treated. Don't use language or images that are offensive, threatening, or discriminatory. #Keep it safe. Do not share personal information such as your phone number, email address, or home address. Do not share information about others without their permission. #Stay on topic. Make sure your posts and comments relate to the topic of the group. Do not post spam, advertisements, or irrelevant content. #Report any issues. If you see something that violates our guidelines, please report it to the group administrator. We will investigate and take appropriate action. Remember to keep our community guidelines in mind as you post and interact with others! Following these guidelines will foster a respectful and safe environment for everyone.", image: "Admin post", like: 1, comment: 0)]
    
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

