//
//  UploadPhotoViewModel.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-07-19.
//

import Foundation
import SwiftUI

class UploadPhotoViewModel: ObservableObject {
    
    /// for selecting an image
    @Published private var image: UIImage?
    /// to view the photo library and user to choose a photo
    @Published var isPickerShowing = false
    
    func uploadPhoto() {
        
        // make sure that the selected image property isn't nil
        guard image != nil else {
            return
        }
        
        // get currentuser uid from auth storage
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        
        // create a storage reference
        //let storageRef = FirebaseManager.shared.storage.reference()
        let storageRef = FirebaseManager.shared.storage.reference(withPath: uid)
        
        // turn image into data
        let imageData = image!.jpegData(compressionQuality: 0.8)
            
        // check that we were able to convert it to data
        guard imageData != nil else {
            return
        }
        
        // specify the file path and and name
        //let path = "images/\(UUID().uuidString).jpg"
        let fileRef = storageRef.child("\(UUID().uuidString).jpg")
            
        // upload data
        let uploadTask = fileRef.putData(imageData!, metadata: nil) { metadata, error in
                
            // check for errors
            if error == nil && metadata != nil {
                
                // save file into firestore database
//                let db = FirebaseManager.shared.firestore
//                db.collection("images").document().setData(["url": path])
            }
        }
        
    }
    
}
