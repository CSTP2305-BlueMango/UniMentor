//
//  ImagePicker.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-10.
//

///reference: https://designcode.io/swiftui-advanced-handbook-imagepicker
///more detailed tutorial for image picker: https://www.youtube.com/watch?v=a05eLxsbCCw

import SwiftUI


//user can choose from pictures in the photo library
struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) private var presentationMode
    
    @Binding var image: UIImage?
    @Binding var isPickerShowing: Bool
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        ///create an instance of the UIImagePickerController
        let imagePicker = UIImagePickerController()
        ///where the image is fetched
        imagePicker.sourceType = .photoLibrary
        ///create an instance of the Coordinator class
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> (Coordinator) {
        return Coordinator(self)
    }
    
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var parent: ImagePicker
    
    init(_ picker: ImagePicker) {
        self.parent = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // run code when the user has selected an image
        print("image selected")
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // getting the image
            DispatchQueue.main.async {
                self.parent.image = image
            }
        }
        
        // dismiss picker
        parent.isPickerShowing = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // run code when the user had cancelled the picker UI
        print("cancelled")
        
        // dismiss picker
        parent.isPickerShowing = false
    }
}
