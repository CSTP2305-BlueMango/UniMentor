//
//  ProfilePictureView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-05-28.
//

import SwiftUI
import Photos

struct ProfilePictureView: View {
    var body: some View {
        
        ZStack {
            Color(red: 0.9490, green: 0.9411, blue: 0.9098)
                .ignoresSafeArea()
            
            Spacer()
            
            ZStack {
                Color(red: 0.6235, green: 0.5450, blue: 0.4235)
                    .ignoresSafeArea()
            }
            .frame(height: 900, alignment: .center)
            .mask(Parallelogram(depth: 130))
            
            VStack(alignment: .center, spacing: 10) {
                VStack(alignment: .center, spacing: 10) {
                    Text("Set Profile")
                        .font(Font.custom("Charm-Regular", size: 60))
                        .padding(.bottom, 10)
                }
                
                ///reference: https://www.youtube.com/watch?v=MJuMIpdpORk
                Image("user")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .overlay(Circle()
                        .stroke(Color.brown, lineWidth: 5))
                
                VStack(alignment: .leading) {
                    ButtonView_2(action: {},
                               label: "Select Image",
                               color: Color(
                                red: 0.8627,
                                green: 0.8470,
                                 blue: 0.7960
                               ),
                                 opacity: 1.0,
                                 isBorder: false
                            )}
                
                ///this pushes the button to the bottom, not fixed
                Spacer()
                    .frame(width: 50, height: 250)
                
                VStack(alignment: .leading) {
                    ButtonView_2(action: {},
                         label: "Next",
                         color: Color(
                            red: 0.8627,
                            green: 0.8470,
                             blue: 0.7960
                         ),
                         opacity: 1.0,
                         isBorder: false
                    )
                }
            }
        }.navigationBarHidden(true)
         .navigationBarBackButtonHidden(true)
    }
}

struct ProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureView()
    }
}

///reference: https://designcode.io/swiftui-advanced-handbook-imagepicker

///Sample code
///The final code for the View is:

//@State private var image = UIImage()
//@State private var showSheet = false
//
//var body: some View {
//        HStack {
//                Image(uiImage: self.image)
//              .resizable()
//              .cornerRadius(50)
//              .frame(width: 100, height: 100)
//              .background(Color.black.opacity(0.2))
//              .aspectRatio(contentMode: .fill)
//              .clipShape(Circle())
//
//     Text("Change photo")
//         .font(.headline)
//         .frame(maxWidth: .infinity)
//         .frame(height: 50)
//         .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.262745098, green: 0.0862745098, blue: 0.8588235294, alpha: 1)), Color(#colorLiteral(red: 0.5647058824, green: 0.462745098, blue: 0.9058823529, alpha: 1))]), startPoint: .top, endPoint: .bottom))
//         .cornerRadius(16)
//         .foregroundColor(.white)
//             .padding(.horizontal, 20)
//             .onTapGesture {
//               showSheet = true
//             }
//        }
//    .padding(.horizontal, 20)
//    .sheet(isPresented: $showSheet) {
//                // Pick an image from the photo library:
//            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
//
//                //  If you wish to take a photo from camera instead:
//                // ImagePicker(sourceType: .camera, selectedImage: self.$image)
//        }
//}
