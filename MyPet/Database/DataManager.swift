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
    
    var currentPet = PetData(id: "", petAvatar: "", petName: "", breed: "")
    
    private var countUserPosts = 0
    
    var allPosts = [PostData]()
    private var posts: [PostData]
    private var users: [UserData]
    private var pets: [PetData]
    
    private init() {
        posts = [PostData]()
        users = [UserData]()
        pets = [PetData]()
    }
    
    //MARK: — user
    
    func chekUser(userID: String, email: String, completion: (() -> Void)?) {
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
                if !user.petID.isEmpty {
                    self.chekPet(petID: user.petID)
                }
                self.updatePostID()
                self.updateUserPosts()
            } else {
                let user = UserData(id: userID, userAvatar: "", userName: "", petID: "", email: email, role: "")
                self.saveUserData(user: user)
                self.countUserPosts = 0
                self.currentUser = user
            }
            self.getAllPosts(completion)
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
    
    //MARK: — pet
    
    func chekPet(petID: String) {
        databaseReference.child("pets").child(petID).getData(completion: { error, snapshot in
            guard error == nil else {
                return
            }
            if let value = snapshot?.value as? NSDictionary {
                let pet = PetData(
                    id: petID,
                    petAvatar: value["petAvatar"] as? String ?? "",
                    petName: value["petName"] as? String ?? "",
                    breed: value["breed"] as? String ?? ""
                )
                self.currentPet = pet
            } else {
                let pet = PetData(id: petID, petAvatar: "", petName: "", breed: "")
                self.currentPet = pet
                self.savePetData(pet: pet)
            }
        })
    }
    
    func savePetData(pet: PetData) {
        databaseReference.child("users").child(currentUser.id).child("petID").setValue(pet.id)
        databaseReference.child("pets").child(pet.id).child("petAvatar").setValue(pet.petAvatar)
        databaseReference.child("pets").child(pet.id).child("petName").setValue(pet.petName)
        databaseReference.child("pets").child(pet.id).child("breed").setValue(pet.breed)
    }
    
    func updateCurrentPet(pet: PetData) {
        savePetData(pet: pet)
        currentPet = pet
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
    
    func saveLikedPost (userID: String, postID: String) {
        
    }
    
    func getAllPosts(_ completion: (() -> Void)?) {
        databaseReference.child("posts").getData { error, snapshot in
            guard error == nil else {
                return
            }
            if let value = snapshot?.value as? NSDictionary {
               var count = 0
                for item in value {
                    if let userID = item.key as? String {
                        self.databaseReference.child("users").child(userID).getData { error, snapshot in
                            guard error == nil else {
                                return
                            }
                            count += 1
                            if let userData = snapshot?.value as? NSDictionary {
                                let userAvatar = userData["userAvatar"] as? String ?? ""
                                let userName = userData["userName"] as? String ?? ""
                                if let arrayPost = item.value as? NSArray {
                                    for dataPost in arrayPost {
                                        if let dataPost = dataPost as? Dictionary <String,String> {
                                            let post = PostData(id: "", userID: userID, authorAvatar: userAvatar, authorName: userName, date: Date(), title: dataPost["title"] ?? "", postDescription: dataPost["description"] ?? "", image: dataPost["image"] ?? "", like: 0, comment: 0)
                                            self.allPosts.append(post)
                                        }
                                    }
                                }
                            }
                            if count == value.count { completion?() }
                        }
                    }
                }
            }
        }
    }
    
    func getAllPosts(userID: String) -> [PostData] {
        posts
    }
    
    func cleanData() {
        posts = []
        currentUser = UserData(id: "", userAvatar: "", userName: "", petID: "", email: "", role: "")
        currentPet = PetData(id: "", petAvatar: "", petName: "", breed: "")
        allPosts = []
    }
    
    private func updateUserPosts() {
        databaseReference.child("posts").child(currentUser.id).getData(completion: { error, snapshot in
            guard error == nil else {
                return
            }
            if let value = snapshot?.value as? NSArray {
                for item in value {
                    if let item = item as? Dictionary <String,String> {
                        let post = PostData(id: "", userID: self.currentUser.id, authorAvatar: self.currentUser.userAvatar, authorName: self.currentUser.userName, date: Date(), title: item["title"] ?? "", postDescription: item["description"] ?? "", image: item["image"], like: 0, comment: 0)
                        self.posts.append(post)
                    }
                }
            }
        })
    }
}

