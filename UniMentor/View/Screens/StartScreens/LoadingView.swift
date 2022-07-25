//
//  LoadingView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-05-28.
//

import SwiftUI

/// loading view
struct LoadingView: View {
    
    // reference: https://mobiraft.com/ios/swiftui/how-to-add-splash-screen-in-swiftui/
    /// loading view finished state
    @State var isActive:Bool = false
    @EnvironmentObject var viewModel: AppViewModel
    
    // reference: https://www.udemy.com/course/swiftui-masterclass-course-ios-development-with-swift/learn/lecture/29012982#overview
    /// onBoardingView active state
    @AppStorage("onboarding") var isOnBoradingViewActive: Bool = true
    
    var body: some View {
        NavigationView {
            ZStack {
                // if loading view finished
                if self.isActive {
                    // show onBoarding view
                    if isOnBoradingViewActive {
                        OnBoardingView()
                    }
                    // if onBoarding view finished
                    else {
                        // if user not logged in
                        if !viewModel.loggedIn {
                            LoginView()
                        }
                        // if user logged in
                        else {
                            TabBarView()
                        }
                    }
                } else {
                    // Loading View
                    ZStack {
                        Color("BackgroundColor")
                            .ignoresSafeArea()
                    }
                    .frame(width: UIScreen.main.bounds.width * 1.5, height: 650, alignment: .center)
                    .mask(Parallelogram(depth: 130))
                    
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.65)
                    //: Loading View
                }
            }
            .hideNavigationBar()
            .onAppear {
               viewModel.loggedIn = viewModel.isLoggedIn
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .statusBar(hidden: false)
        //:NAVIGATION
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
