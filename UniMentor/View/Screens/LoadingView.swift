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
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        ZStack {
            if self.isActive {
                if !viewModel.loggedIn {
                    LoginView()
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
            viewModel.loggedIn = viewModel.isLoggedIn
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
