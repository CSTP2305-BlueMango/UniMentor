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
                Color(red: 0.7803, green: 0.7176, blue: 0.6196)
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
