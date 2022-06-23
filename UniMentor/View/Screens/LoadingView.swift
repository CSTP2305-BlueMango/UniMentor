//
//  LoadingView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-05-28.
//

import SwiftUI

struct LoadingView: View {
    
    // reference: https://mobiraft.com/ios/swiftui/how-to-add-splash-screen-in-swiftui/
    @State var isActive:Bool = false
    @State var isLoginActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                if !isLoginActive {
                    LoginView(isLoginActive: $isLoginActive)
                } else {
                    TabBarView()
                }
            } else {
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
        
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
