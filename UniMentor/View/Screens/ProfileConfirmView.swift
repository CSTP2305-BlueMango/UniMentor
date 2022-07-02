//
//  ProfileConfirmView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-22.
//

import SwiftUI

struct ProfileConfirmView: View {
    @State var name: String = "First Lastname"
    @State var major: String = "Computer Systems Technology"
    @State var school: String = "Vancouver Community College"
    @State var startDate: String = "September 2020"
    @State var info: String = """
                I guess we could discuss the implications of the phrase meant to be.

                That is if we wanted to drown ourselves in a sea of backwardly referential semantics and other mumbo-jumbo.
                """
    
    @State var isFinished = false
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            ScrollView {
                // BODY
                VStack(spacing: UIScreen.main.bounds.height * 0.05) {
                    ZStack(alignment: .top) {
                        // Background
                        ZStack {}
                        .frame(minWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
                        .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                        .padding(.top, UIScreen.main.bounds.height * 0.11)
                        VStack {
                            ProfileView(
                                name: name,
                                major: major,
                                school: school,
                                startDate: startDate,
                                introduction: info)
                                .padding(.bottom, UIScreen.main.bounds.height * 0.05)
                        }
                    }.frame(minHeight: UIScreen.main.bounds.height * 0.5)
                    // FOOTER
                    VStack() {
                        ButtonView_2(action: {
                            
                            // TODO: finish sign up
                            isFinished = true
                        },
                             label: "Get Started",
                             color: Color("TabBarColor"),
                             opacity: 1.0,
                             isBorder: false
                        )
                    } //: FOOTER
                }.frame(minHeight: UIScreen.main.bounds.height * 0.9)
                //: BODY
            }//: ScrollView
        }
        .hideNavigationBar()
        //: ZSTACK
    }
}

struct ProfileConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileConfirmView()
    }
}
