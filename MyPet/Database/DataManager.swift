//
//  DataManager.swift
//  MyPet
//
//  Created by Дина Шварова on 28.08.2023.
//

import UIKit
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
        posts = [PostData]()
        users = [UserData]()
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
    
    func savePostData(title: String, description: String, image: UIImage?) {
        self.countUserPosts += 1
        if let image = image {
            ImageManager.uploadPostImage(userID: DataManager.shared.currentUser.id, postID: String(countUserPosts), image: image, completion: { result in
                var imageURL: URL?
                switch result {
                case .success(let url):
                    imageURL = url
                case .failure(_):
                    imageURL = nil
                }
                self.sendPost(title: title, description: description, image: imageURL?.absoluteString)
            })
        } else {
            sendPost(title: title, description: description, image: nil)
        }
    }
    
    private func sendPost (title: String, description: String, image: String?) {
     self.databaseReference.child("posts").child(self.currentUser.id).child(String(self.countUserPosts)).child("title").setValue(title)
        self.databaseReference.child("posts").child(self.currentUser.id).child(String(self.countUserPosts)).child("description").setValue(description)
        self.databaseReference.child("posts").child(self.currentUser.id).child(String(self.countUserPosts)).child("image").setValue(image ?? "")
        self.posts.append(PostData(id: String(self.countUserPosts), userID: self.currentUser.id, authorAvatar: self.currentUser.userAvatar, authorName: self.currentUser.userName, date: Date(), title: title, postDescription: description, image: image ?? "", like: 0, comment: 0))
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
