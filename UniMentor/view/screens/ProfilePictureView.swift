//
//  ProfilePictureView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-05-28.
//

import SwiftUI

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
                    ButtonView(action: {},
                               label: "Select Image",
                               color: Color(
                                red: 0.8627,
                                green: 0.8470,
                                 blue: 0.7960
                               )
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
                         )
                    )
                }
            }
        }
    }
}

struct ProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureView()
    }
}
