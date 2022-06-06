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
                
                VStack(alignment: .center, spacing: 10) {
                    Button(action: {}) {
                        Text("Select image")
                            .padding(0)
                            .frame(width: 250, height: 30)
                            .font(Font.custom("TimesNewRomanPSMT", size: 20))
                    }
                    .background(Color(red: 0.8627, green: 0.8470, blue: 0.7960).cornerRadius(20).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                    .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                    .buttonStyle(.bordered)
                    .frame(height: 150)
                }
                
                VStack(alignment: .center, spacing: 10) {
                    Button(action: {}) {
                        Text("Next")
                            .padding(0)
                            .frame(width: 355, height: 50)
                            .font(Font.custom("TimesNewRomanPSMT", size: 20))
                    }
                    .background(Color(red: 0.8627, green: 0.8470, blue: 0.7960).cornerRadius(20).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                    .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                    .buttonStyle(.bordered)
                    .frame(height: 150)
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
