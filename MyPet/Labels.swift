//
//  Labels.swift
//  MyPet
//
//  Created by Дина Шварова on 01.09.2023.
//

import Foundation

enum Labels {
    enum Auth {
        static let welcomeLabel = "love brings us together 🙌".localized
        static let welcomeTextLabel = "social network for pet owners, vets, breeders and clubs".localized
        static let logIn = "Log In".localized
        static let signUp = "Sign Up".localized
        static let errorAction = "Error".localized
        static let alert = "Ok".localized
        static let emailLabel = "Your email".localized
        static let passwordLabel = "Your password".localized
        static let passwordPlaceholder = "Password".localized
    }
    enum Home {
        static let title = "Home".localized
        static let search = "Search".localized
    }
    enum Profile {
        static let title = "Profile".localized
        static let petLabel = "My pet".localized
        static let photoLabel = "My photos".localized
        static let postLabel = "My post".localized
    }
    enum Edit {
        static let nameLabel = "Your name".localized
        static let roleLabel = "Role".localized
        static let petNameLabel = "Pet name".localized
        static let breed = "Breed".localized
        static let saveButton = "Save".localized
    }
    enum Post {
        static let titleLabel = "Title".localized
        static let descriptionLabel = "Description".localized
        static let publishButton = "Publish".localized
    }
    enum Liked {
        static let titleLabel = "Liked".localized
    }
    enum Settings {
        static let titleLabel = "Settings".localized
        static let editButton = "Edit profile".localized
        static let exitButton = "Log Out".localized
        static let manifestoButton = "Read manifesto".localized
    }
    enum Manifesto {
        static let title = "Our manifesto".localized
        static let text = """
We believe that pets are an integral part of our lives, and they deserve the best care and attention.

Our social network need to connects pet owners, vets, breeders, and clubs in a meaningful way to create connect with like-minded.

We can't wait for you to share your experiences and connect with others who share your love! Please read our community guidelines carefully before posting or interacting with others. We're committed to maintaining a interesting and welcoming space for everyone. To ensure that everyone has a positive experience, we ask that you follow these guidelines:

#Only the important. Keep your thoughts short and concise — we have a limit of 50 characters for the title and 280 for the description.

#Be respectful. Treat others as you would like to be treated. Don't use language or images that are offensive, threatening, or discriminatory.

#Keep it safe. Do not share personal information such as your phone number, email address, or home address. Do not share information about others without their permission.

#Stay on topic. Make sure your posts and comments relate to the topic of the group. Do not post spam, advertisements, or irrelevant content.

#Report any issues. If you see something that violates our guidelines, please report it to the group administrator. We will investigate and take appropriate action.

Remember to keep our community guidelines in mind as you post and interact with others! Following these guidelines will foster a respectful and safe environment for everyone. We reserve the right to remove сontent that violates our guidelines.
""".localized
    }
}
