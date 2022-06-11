//
//  ProfilePictureView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-05-28.
//

import SwiftUI
import Photos

struct ProfilePictureView: View {
    
    @State private var image = UIImage()
    @State private var showSheet = false
    
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
                
                ///reference: https://www.youtube.com/watch?v=MJuMIpdpORk for clipShape(Circle())
                VStack {
                   Image(uiImage: self.image)
                        .resizable()
                        .cornerRadius(50)
                        .frame(width: 150, height: 150)
                        .background(Color.black.opacity(0.2))
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
               
                ///reference: https://designcode.io/swiftui-advanced-handbook-imagepicker for selecting image
                    VStack(alignment: .leading) {
                        SmallButtonView(
                            action: {
                                showSheet = true
                            },
                            label: "Select Image",
                            color: Color(
                                red: 0.86,
                                green: 0.85,
                                blue: 0.80
                            ),
                            width: UIScreen.main.bounds.width * 0.85,
                            height: UIScreen.main.bounds.height * 0.05
                        )

                            .onTapGesture {
                              showSheet = true
                            }
                            .sheet(isPresented: $showSheet) {
                                    // Pick an image from the photo library:
                                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)

                                    //  If you wish to take a photo from camera instead:
                                    // ImagePicker(sourceType: .camera, selectedImage: self.$image)
                                    }

                        }
                    
                        ///this pushes the button to the bottom, not fixed
                        Spacer()
                            .frame(width: 50, height: 250)
                        
                        VStack(alignment: .leading) {
                            ButtonView(action: {},
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
                    } ///VStack end for picture and small button
                }.navigationBarHidden(true)
                 .navigationBarBackButtonHidden(true)
        } ///ZStack end
    }
}


struct ProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureView()
    }
}
