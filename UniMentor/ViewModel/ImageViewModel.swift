//
//  ImageViewModel.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-20.
//

import Foundation
import UIKit

class ImageViewModel: ObservableObject {
    /// error message
    @Published var errorMessage = ""
    static var imageUrl = ""
    @Published var isImageFinished = false
    func persistImageToStorage(image: UIImage?) {
        
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        print("-test")
        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
        guard let imageData = image?.jpegData(compressionQuality: 0.5) else { return }
        print("test")
        ref.putData(imageData, metadata: nil) { metadata, err in
            if let err = err {
                self.errorMessage = "Failed to push image to Storage: \(err)"
                return
            }

            ref.downloadURL { url, err in
                if let err = err {
                    self.errorMessage = "Failed to retrieve downloadURL: \(err)"
                    return
                }

                self.errorMessage = "Successfully stored image with url: \(url?.absoluteString ?? "")"
                ImageViewModel.imageUrl = url?.absoluteString ?? ""
                print("---- \(ImageViewModel.imageUrl)")
                self.isImageFinished = true
            }
        }
    }
}
