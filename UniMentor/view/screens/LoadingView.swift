//
//  LoadingView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-05-28.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(red: 0.9490, green: 0.9411, blue: 0.9098)
                .ignoresSafeArea()
            Spacer()
            ZStack {
                Color(red: 0.6235, green: 0.5450, blue: 0.4235)
                    .ignoresSafeArea()
            }
            .frame(height: 100, alignment: .top)
            .mask(Parallelogram(depth: -120))
            .offset(y: -470)
            
            ZStack {
                Color(red: 0.6235, green: 0.5450, blue: 0.4235)
                    .ignoresSafeArea()
            }
            .frame(height: 650, alignment: .center)
            .mask(Parallelogram(depth: 130))
            
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 300)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
