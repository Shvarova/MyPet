//
//  ImageManager.swift
//  MyPet
//
//  Created by Дина Шварова on 30.08.2023.
//

import UIKit
import Firebase
import FirebaseStorage

class ImageManager {
    
   static func uploadUserAvatar(id: String, photo: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
       let ref = Storage.storage().reference().child("User").child(id)
        guard let imageData = photo.jpegData(compressionQuality: 0.4) else { return }
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        ref.putData(imageData, metadata: metadata) { (metadata, error) in
            guard let metadata = metadata else {
                completion(.failure(error!))
                return
            }
            ref.downloadURL { (url, error) in
                guard let url = url else {
                    completion(.failure(error!))
                    return
                }
                completion(.success(url))
            }
        }
    }
    
    static func uploadPetAvatar(id: String, photo: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        let ref = Storage.storage().reference().child("Pet").child(id)
         guard let imageData = photo.jpegData(compressionQuality: 0.4) else { return }
         
         let metadata = StorageMetadata()
         metadata.contentType = "image/jpeg"
         
         ref.putData(imageData, metadata: metadata) { (metadata, error) in
             guard let metadata = metadata else {
                 completion(.failure(error!))
                 return
             }
             ref.downloadURL { (url, error) in
                 guard let url = url else {
                     completion(.failure(error!))
                     return
                 }
                 completion(.success(url))
             }
         }
     }
    
    static func uploadPostImage(userID: String, postID: String, image: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        let ref = Storage.storage().reference().child("Post").child(userID).child(postID)
         guard let imageData = image.jpegData(compressionQuality: 0.4) else { return }
         
         let metadata = StorageMetadata()
         metadata.contentType = "image/jpeg"
         
         ref.putData(imageData, metadata: metadata) { (metadata, error) in
             guard let metadata = metadata else {
                 completion(.failure(error!))
                 return
             }
             ref.downloadURL { (url, error) in
                 guard let url = url else {
                     completion(.failure(error!))
                     return
                 }
                 completion(.success(url))
             }
         }
     }
}
