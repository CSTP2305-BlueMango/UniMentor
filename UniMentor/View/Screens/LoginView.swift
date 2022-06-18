//
//  LoginView.swift
//  UniMentor
//
//  Created by Sovereign of solitude on 2022-05-24.

import SwiftUI

struct LoginView: View {
    @State var emailValue: String = ""
    @State var passwordValue: String = ""
    
    //state for keeping track of if link to signup is active
    @State var isSignUpActive = false
    
    var body: some View {
        
        //NAVIGATION
        NavigationView {
            // ZSTACK
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                //NAVIGATION LINK
                NavigationLink(
                    destination: SignUpView(),
                    isActive: $isSignUpActive
                ) {EmptyView()}
                //:NAVIGATION LINK
                
                //BODY
                VStack() {
                    // HEADER
                    VStack(alignment: .center) {
                        Text("Login")
                            .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.15))
                    } //: HEADER
                    Spacer()
                    
                    VStack(spacing: UIScreen.main.bounds.width * 0.015) {//LOGINFORM
                        InputFieldView(
                            value: $emailValue,
                            placeholder:"sample@gmail.com",
                            icon: "envelope.fill",
                            title: "Email",
                            errorMessage: ""
                        )
                        InputFieldView(
                            value: $passwordValue,
                            placeholder:"PrancingPonies123",
                            icon: "key.fill",
                            title: "Password",
                            errorMessage: "Test"
                        )
                        Spacer()
                        ButtonView_2 (
                            action: {},
                            label: "Login",
                            color: Color("TabBarColor"),
                            opacity: 1.0,
                            isBorder: false
                        ).padding()
                    }//:LOGINFORM
                    .frame(height: UIScreen.main.bounds.height * 0.36)
                    Spacer()
                    Spacer()
                    //FOOTER
                    VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.01) {
                        VStack(alignment: .trailing) {
                            Text("Don't have an account yet?")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                        }
                        .padding(EdgeInsets(top: 0, leading: UIScreen.main.bounds.width * 0.02, bottom: 0, trailing: 0))
                        ButtonView_2(
                            action: {
                                print("hello")
                                self.isSignUpActive = true
                            },
                            label: "Sign up",
                            color: Color(
                               red: 1,
                                green: 1,
                                blue: 1
                            ),
                            opacity: 0.0,
                            isBorder: true
                        )
                    }//:FOOTER
                }//:BODY
                .frame(height: UIScreen.main.bounds.height * 0.85)
            }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)//:ZSTACK
        }.navigationViewStyle(.stack)//:NAVIGATION
            .statusBar(hidden: false)
    }
}
 
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
