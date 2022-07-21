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
    static var imageUrl = ""
    @Published var isImageFinished = false
    
    @MainActor
    func persistImageToStorage(image: UIImage?) async {
        guard let uid = try FirebaseManager.shared.auth.currentUser?.uid else { return }
        print("-test")
        let ref = try FirebaseManager.shared.storage.reference(withPath: uid)
        guard let imageData = image?.jpegData(compressionQuality: 0.5) else { return }
        print("test")
        try await ref.putData(imageData, metadata: nil) { metadata, err in
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
