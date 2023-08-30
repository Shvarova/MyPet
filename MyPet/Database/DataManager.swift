//
//  CoreDataManager.swift
//  MyPet
//
//  Created by Дина Шварова on 28.08.2023.
//

import FirebaseCore
import FirebaseDatabase

class DataManager {
    
    var databaseReference = Database.database().reference()
    
    static let shared = DataManager()
    
    var currentUser = UserData(id: "", userAvatar: "", userName: "", petID: "", email: "", role: "")
    private var countUserPosts = 0
    
    private var posts: [PostData]
    private var users: [UserData]
    private var pets: [PetData]
    
    private init() {
        posts = [PostData(id: "1", userID: "2", authorAvatar: "Admin avatar", authorName: "my pet", date: Date(), title: "Welcome to our social network!", postDescription: "We can't wait for you to share your experiences and connect with others who share your love! Please read our community guidelines carefully before posting or interacting with others. We're committed to maintaining a interesting and welcoming space for everyone. To ensure that everyone has a positive experience, we ask that you follow these guidelines: #Be respectful. Treat others as you would like to be treated. Don't use language or images that are offensive, threatening, or discriminatory. #Keep it safe. Do not share personal information such as your phone number, email address, or home address. Do not share information about others without their permission. #Stay on topic. Make sure your posts and comments relate to the topic of the group. Do not post spam, advertisements, or irrelevant content. #Report any issues. If you see something that violates our guidelines, please report it to the group administrator. We will investigate and take appropriate action. Remember to keep our community guidelines in mind as you post and interact with others! Following these guidelines will foster a respectful and safe environment for everyone.", image: "Admin post", like: 1, comment: 0), PostData(id: "1", userID: "4", authorAvatar: "Admin avatar", authorName: "my pet", date: Date(), title: "Welcome to our social network!", postDescription: "Hi!", image: "Admin post", like: 1, comment: 0)]
        users = [UserData(id: "2", userAvatar: "Admin avatar", userName: "Admin", petID: "1", email: "admin@mail.ru", role: "pet owner")]
        pets = [PetData(id: "1", petAvatar: "Pet avatar", petName: "Java", breed: "cat")]
    }
    
    func chekUser(userID: String, email: String) {
        databaseReference.child("users").child(userID).getData(completion: { error, snapshot in
            guard error == nil else {
                return
            }
            if let value = snapshot?.value as? NSDictionary {
                let user = UserData(
                    id: userID,
                    userAvatar: value["userAvatar"] as? String ?? "",
                    userName: value["userName"] as? String ?? "",
                    petID: value["petID"] as? String ?? "",
                    email: value["email"] as? String ?? "",
                    role: value["role"] as? String ?? ""
                )
                self.currentUser = user
            } else {
                let user = UserData(id: userID, userAvatar: "", userName: "", petID: "", email: email, role: "")
                self.saveUserData(user: user)
            }
            self.updatePostID()
            self.updateUserPosts()
        })
    }
    
    func saveUserData(user: UserData) {
        databaseReference.child("users").child(user.id).child("userAvatar").setValue(user.userAvatar)
        databaseReference.child("users").child(user.id).child("userName").setValue(user.userName)
        databaseReference.child("users").child(user.id).child("petID").setValue(user.petID)
        databaseReference.child("users").child(user.id).child("email").setValue(user.email)
        databaseReference.child("users").child(user.id).child("role").setValue(user.role)
    }
    
    func updateCurrentUser(user: UserData) {
        saveUserData(user: user)
        currentUser = user
    }
    
    func savePetData(pet: PetData) {
        databaseReference.child("users").child(currentUser.id).child("petID").setValue(pet.id)
        databaseReference.child("pets").child(pet.id).child("petAvatar").setValue(pet.petAvatar)
        databaseReference.child("pets").child(pet.id).child("petName").setValue(pet.petName)
        databaseReference.child("pets").child(pet.id).child("breed").setValue(pet.breed)
    }
    
    //MARK: — post
    
    private func updatePostID() {
        databaseReference.child("posts").child(currentUser.id).getData(completion: { error, snapshot in
            guard error == nil else {
                return
            }
            if let value = snapshot?.value as? NSArray {
                self.countUserPosts = value.count - 1
            }
        })
    }
    
    func savePostData(title: String, description: String) {
        self.countUserPosts += 1
        databaseReference.child("posts").child(currentUser.id).child(String(countUserPosts)).child("title").setValue(title)
        databaseReference.child("posts").child(currentUser.id).child(String(countUserPosts)).child("description").setValue(description)
        posts.append(PostData(id: "", userID: self.currentUser.id, authorAvatar: self.currentUser.userAvatar, authorName: self.currentUser.userName, date: Date(), title: title, postDescription: description, image: "", like: 0, comment: 0))
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
        posts
    }
    
    func cleanData() {
        posts = []
        currentUser = UserData(id: "", userAvatar: "", userName: "", petID: "", email: "", role: "")
    }
    
    private func updateUserPosts() {
        databaseReference.child("posts").child(currentUser.id).getData(completion: { error, snapshot in
            guard error == nil else {
                return
            }
            if let value = snapshot?.value as? NSArray {
                for item in value {
                    if let item = item as? Dictionary <String,String> {
                        let post = PostData(id: "", userID: self.currentUser.id, authorAvatar: self.currentUser.userAvatar, authorName: self.currentUser.userName, date: Date(), title: item["title"] ?? "", postDescription: item["description"] ?? "", image: "", like: 0, comment: 0)
                        self.posts.append(post)
                    }
                }
            }
        })
    }
}
