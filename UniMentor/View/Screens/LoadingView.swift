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
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
            }
            .frame(height: 650, alignment: .center)
            .mask(Parallelogram(depth: 130))
            
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.65)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
