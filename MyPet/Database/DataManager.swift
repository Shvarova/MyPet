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
        let postID = DataManager.shared.currentUser.id + "_" + String(countUserPosts)
        if let image = image {
            ImageManager.uploadPostImage(
                userID: DataManager.shared.currentUser.id,
                postID: postID,
                image: image,
                completion: { result in
                var imageURL: URL?
                switch result {
                case .success(let url):
                    imageURL = url
                case .failure(_):
                    imageURL = nil
                }
                    self.sendPost(id: postID, title: title, description: description, image: imageURL?.absoluteString)
            })
        } else {
            sendPost(id: postID, title: title, description: description, image: nil)
        }
    }
    
    private func sendPost (id: String, title: String, description: String, image: String?) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        self.databaseReference.child("posts").child(self.currentUser.id).child(id).child("title").setValue(title)
        self.databaseReference.child("posts").child(self.currentUser.id).child(id).child("description").setValue(description)
        self.databaseReference.child("posts").child(self.currentUser.id).child(id).child("image").setValue(image ?? "")
        self.databaseReference.child("posts").child(self.currentUser.id).child(id).child("date").setValue(dateFormatter.string (from: date))
        self.databaseReference.child("posts").child(self.currentUser.id).child(id).child("likes").setValue(0)
        self.posts.append(PostData(id: id, userID: self.currentUser.id, authorAvatar: self.currentUser.userAvatar, authorName: self.currentUser.userName, date: dateFormatter.string (from: date), title: title, postDescription: description, image: image ?? "", like: 0, comment: 0))
    }
    
    func saveLikedPost (postID: String, likesCount: Int) {
        allPosts = allPosts.map({
            if $0.id == postID {
                let post = PostData(id: $0.id, userID: $0.userID, authorAvatar: $0.authorAvatar, authorName: $0.authorName, date: $0.date, title: $0.title, postDescription: $0.postDescription, image: $0.image, like: likesCount, comment: $0.comment)
                return post
            }
            return $0
        })
        let postUsersID = postID.split(separator: "_")
        databaseReference.child("posts").child(String(postUsersID[0])).child(postID).child("likes").setValue(likesCount)
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
                                if let arrayPost = item.value as? Dictionary <String,Any> {
                                    for dataPost in arrayPost {
                                        if let dataPostValue = dataPost.value as? Dictionary <String,Any>,
                                        let dataPostKey = dataPost.key as? String {
                                            let post = PostData(
                                                id: dataPostKey,
                                                userID: userID,
                                                authorAvatar: userAvatar,
                                                authorName: userName,
                                                date: dataPostValue["date"] as? String ?? "",
                                                title: dataPostValue["title"] as? String ?? "",
                                                postDescription: dataPostValue["description"] as? String ?? "",
                                                image: dataPostValue["image"] as? String ?? "",
                                                like: dataPostValue["likes"] as? Int ?? 0,
                                                comment: 0
                                            )
                                            self.allPosts.append(post)
                                        }
                                    }
                                }
                            }
                            if count == value.count {
                                completion?()
                                let dateFormatter = DateFormatter()
                                dateFormatter.dateFormat = "dd.MM.yy"
                                self.allPosts.sort(by: {
                                    dateFormatter.date(from: $0.date)! > dateFormatter.date(from: $1.date)!
                                })
                            }
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
            if let value = snapshot?.value as? NSDictionary {
                for item in value {
                    if let item = item.value as? Dictionary <String,Any> {
                        let post = PostData(id: "", userID: self.currentUser.id, authorAvatar: self.currentUser.userAvatar, authorName: self.currentUser.userName, date: item["date"] as? String ?? "", title: item["title"] as? String ?? "", postDescription: item["description"] as? String ?? "", image: item["image"] as? String, like: item["likes"] as? Int ?? 0, comment: 0)
                        self.posts.append(post)
                    }
                }
            }
        })
    }
}

