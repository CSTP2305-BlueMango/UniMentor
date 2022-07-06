//
//  OnBoardingView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-04.
//

import SwiftUI

/// onboarding
struct OnBoardingView: View {
    /// if onboarding is active
    @AppStorage("onboarding") var isOnBoradingViewActive: Bool = true
    /// onboarding page index
    @State var currentStep = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            // Background
            VStack {
                ZStack {
                    Color("BackgroundColor")
                        .ignoresSafeArea()
                }
                .frame(width: UIScreen.main.bounds.width * 1.5, height: 370, alignment: .center)
                .mask(Parallelogram(depth: 130))
                .blur(radius: 2)
            }.padding(.top, -UIScreen.main.bounds.width * 0.4)
            //: Background
            VStack {
                // HEADER
                HStack {
                    // Logo
                    Image("SmallLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.width * 0.2)
                        .padding(.leading, -UIScreen.main.bounds.width * 0.07)
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width * 0.9)
                //: HEADER
                Spacer()
                // MAIN
                VStack {
                    // OnBoarding
                    TabView(selection: $currentStep) {
                        // 1st onboarding view
                        VStack(spacing: UIScreen.main.bounds.height * 0.05)  {
                            Text("Be each other's Mentor")
                                .font(Font.custom( "TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.11))
                                .frame(width: UIScreen.main.bounds.width * 0.8, alignment: .leading)
                            Text("Match with others and help each other to be better on academics")
                                .font(Font.custom( "TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                                .frame(width: UIScreen.main.bounds.width * 0.8, alignment: .leading)
                        }
                        .tag(0)
                        // 2nd onboarding view
                        VStack(spacing: UIScreen.main.bounds.height * 0.05)  {
                            Text("Develop connections")
                                .font(Font.custom( "TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.11))
                                .frame(width: UIScreen.main.bounds.width * 0.8, alignment: .leading)
                            Text("Become friends with people among various institutions")
                                .font(Font.custom( "TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                                .frame(width: UIScreen.main.bounds.width * 0.8, alignment: .leading)
                        }
                        .tag(1)
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    //: OnBoarding
                    // Step circle icon
                    HStack(spacing: UIScreen.main.bounds.width * 0.04) {
                        Circle()
                            .frame(width: UIScreen.main.bounds.width * 0.03, height: UIScreen.main.bounds.width * 0.03)
                            .foregroundColor(Color(currentStep == 0 ? "TabBarColor" : "LightColor"))
                        Circle()
                            .frame(width: UIScreen.main.bounds.width * 0.03, height: UIScreen.main.bounds.width * 0.03)
                            .foregroundColor(Color(currentStep == 0 ? "LightColor" : "TabBarColor"))
                    }.frame(height: UIScreen.main.bounds.height * 0.08)
                    //: Step circle icon
                    // Button
                    ButtonView_2(action: {
                        if currentStep == 0 {
                            // next page
                            currentStep = 1
                        } else {
                            // finish onboarding view
                            isOnBoradingViewActive = false
                        }
                    },
                         label: (currentStep == 0 ? "Next": "Get Started"),
                         color: Color("ButtonColor"),
                         opacity: 1.0,
                         isBorder: false
                    )
                }
                .frame(height: UIScreen.main.bounds.height * 0.7)
                //: MAIN
                Spacer()
            } //: VSTACK
        }.hideNavigationBar()
        //: VSTACK
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
