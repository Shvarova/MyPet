//
//  CoreDataManager.swift
//  MyPet
//
//  Created by Дина Шварова on 28.08.2023.
//

import CoreData

class CoreDataManager {
   
   static let shared = CoreDataManager()
    
    var currentUser = UserData(id: "", userAvatar: "", userName: "", petID: "", email: "", role: "")
    
    private var posts: [PostData]
    private var users: [UserData]
    private var pets: [PetData]
    
    private init() {
        posts = [PostData(id: "1", userID: "2", authorAvatar: "Admin avatar", authorName: "my pet", date: Date(), title: "Welcome to our social network!", postDescription: "We can't wait for you to share your experiences and connect with others who share your love! Please read our community guidelines carefully before posting or interacting with others. We're committed to maintaining a interesting and welcoming space for everyone. To ensure that everyone has a positive experience, we ask that you follow these guidelines: #Be respectful. Treat others as you would like to be treated. Don't use language or images that are offensive, threatening, or discriminatory. #Keep it safe. Do not share personal information such as your phone number, email address, or home address. Do not share information about others without their permission. #Stay on topic. Make sure your posts and comments relate to the topic of the group. Do not post spam, advertisements, or irrelevant content. #Report any issues. If you see something that violates our guidelines, please report it to the group administrator. We will investigate and take appropriate action. Remember to keep our community guidelines in mind as you post and interact with others! Following these guidelines will foster a respectful and safe environment for everyone.", image: "Admin post", like: 1, comment: 0), PostData(id: "1", userID: "4", authorAvatar: "Admin avatar", authorName: "my pet", date: Date(), title: "Welcome to our social network!", postDescription: "Hi!", image: "Admin post", like: 1, comment: 0)]
        users = [UserData(id: "2", userAvatar: "Admin avatar", userName: "Admin", petID: "1", email: "admin@mail.ru", role: "pet owner")]
        pets = [PetData(id: "1", petAvatar: "Pet avatar", petName: "Java", breed: "cat")]
    }
    
    func saveUserData(user: UserData) {
        
    }
    
    func savePetData(pet: PetData) {
        
    }
    
    func savePostData(title: String, description: String) {
       let post = PostData(id: "1", userID: "2", authorAvatar: "Admin avatar", authorName: "my pet", date: Date(), title: title, postDescription: description, image: "Admin post", like: 1, comment: 0)
        posts.append(post)
    }
    
    func deleteUserData(id: String) {
        
    }
    
    func deletePetData(id: String) {
        
    }
    
    func deletePostData(id: String) {
        
    }
    
    func getUserData(id: String) {
        
    }
    
    func getPetData(id: String) {
        
    }
    
    func getPostData(id: String) {
        
    }
    
    func getAllPosts() -> [PostData] {
        posts
    }
    
    func getAllPosts(userID: String) -> [PostData] {
        posts.filter{
            $0.userID == userID
        }
    }
    
}
