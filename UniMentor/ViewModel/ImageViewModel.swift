//
//  ImageViewModel.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-20.
//

import Foundation
import UIKit

// reference: https://www.youtube.com/watch?v=5inXE5d2MUM&list=PL0dzCUj1L5JEN2aWYFCpqfTBeVHcGZjGw&index=4

class ImageViewModel: ObservableObject {
    /// error message
    @Published var errorMessage = ""
    /// image url from firebase storage
    static var imageUrl = ""
    /// image save and get finished state
    @Published var isImageFinished = false
    
    /// save image to firebase strorage and get url
    func persistImageToStorage(image: UIImage?) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
        guard let imageData = image?.jpegData(compressionQuality: 0.5) else { return }
        ref.putData(imageData, metadata: nil) { metadata, err in
            if let err = err {
                self.errorMessage = "ImageViewModel: Failed to push image to Storage: \(err)"
                return
            }
            ref.downloadURL { url, err in
                if let err = err {
                    self.errorMessage = "ImageViewModel: Failed to retrieve downloadURL: \(err)"
                    return
                }
                ImageViewModel.imageUrl = url?.absoluteString ?? ""
                self.isImageFinished = true
            }
        }
    }
}
