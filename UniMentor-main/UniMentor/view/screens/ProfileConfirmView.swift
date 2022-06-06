//
//  ProfileConfirmView.swift
//  UniMentor
//
//  Created by Jessie sihota on 2022-05-29.
//

import Foundation

import SwiftUI

struct ProfileConfirmView: View {
    var body: some View {
        ZStack {
            Color(red: 0.9490, green: 0.9411, blue: 0.9098)
                .ignoresSafeArea()
            
            Spacer()
            
            ZStack {
                Color(red: 0.6235, green: 0.5450, blue: 0.4235)
                    .ignoresSafeArea()
                Rectangle()
                    
                    .fill(.white)
                    .frame(width: UIScreen.main.bounds.size.width, height: 529, alignment: .center)
            }
            .frame(height: 900, alignment: .center)
            .mask(Parallelogram(depth: 130))
        
            VStack(alignment: .center, spacing: 10) {
                Image("pfpfiller")
                    .resizable()
                    .frame(width: 134, height: 154)
                Text("First LastName")
                    .font(.system(size: 32))
                
                Rectangle()
                    .fill(.gray)
                    .frame(width: 352, height: 1, alignment: .center)
                    .padding(15)
                
                Text("Computer Technology")
                    .frame(width: 322, alignment: .leading)
                    .font(.system(size: 24))
                
                Text("Vancouver Community College")
                    .frame(width: 322, alignment: .leading)
                    .font(.system(size: 16))
                
                Text("Start Date: Sept 2019")
                    .frame(width: 322, alignment: .leading)
                    .font(.system(size: 13))
                
                Rectangle()
                    .fill(.gray)
                    .frame(width: 352, height: 1, alignment: .center)
                    .padding(15)
                
                Text("Fusce cursus dolor hendrerit pretium aliquet. Nam id sodales sem. Curabitur volutpat,\n\narcu non bibendum tempor, tellus lorem aliquet lorem,arcu non bibendum tempor, tellus lorem aliquet lorem,")
                    .frame(width: 322, alignment: .leading)
                    .font(.system(size: 16))
                
                
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
                }.offset(y: 90)
                
            }
        }
    }
}

struct ProfileConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileConfirmView()
    }
}
