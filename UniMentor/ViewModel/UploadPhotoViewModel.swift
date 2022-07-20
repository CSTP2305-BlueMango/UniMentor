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
    @Published var image: UIImage?
    /// to view the photo library and user to choose a photo
    @Published var isPickerShowing = false
    
    @Published var user: User?
    
    @Published var errMessage = ""
    
    func uploadPhoto() {

            guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
            
            //filename or path to the file
            let ref = FirebaseManager.shared.storage.reference(withPath: uid)
            guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
            ref.putData(imageData, metadata: nil) { metadata, err in
                if let err = err {
                    self.errMessage = "Failed to push image to Storage: \(err)"
                    return
                }

                ref.downloadURL { url, err in
                    if let err = err {
                        self.errMessage = "Failed to retrieve downloadURL: \(err)"
                        return
                    }

                    //this will show that the image was successfully saved into firestore
                    self.errMessage = "Successfully stored image with url: \(url?.absoluteString ?? "")"
                    print(url?.absoluteString)
                    
                    guard let url = url else { return }
                    self.saveUserPhoto(imageUrl: url)
                }
            }
        }// :uploadphoto

        // store information into Firestore database
        func saveUserPhoto(imageUrl: URL) {

            guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
                return }

            //create the dictionary, this is what will be stored in the database
            let userInfo = [
                "uid": uid,
                "name": self.user?.name,
                "image": imageUrl.absoluteString,
                "major": self.user?.major,
                "school": self.user?.school,
                "startDate": self.user?.startDate,
                "intro": self.user?.intro]

            //this makes the collection of users into the firestore database
            FirebaseManager.shared.firestore.collection("users")
                .document(uid).setData(userInfo) { error in
                    if let error = error {
                        print(error)
                        self.errMessage = "\(error)"
                        return
                    }

                    print("Success")
            }// :storeuserinfo
        }
}
