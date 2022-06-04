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
            ZStack { // ZSTACK
                
                Color(red: 0.7803, green: 0.7176, blue: 0.6196)
                    .ignoresSafeArea()
                
                //NAVIGATION LINK
                NavigationLink(
                    destination: SignUpView(),
                    isActive: $isSignUpActive
                ) {EmptyView()}
                //:NAVIGATION LINK
                
                //BODY
                VStack() {
                    Text("Login")//HEADER
                        .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.15))
                        .padding(.top)
                    Spacer()
                    
                    VStack(spacing: UIScreen.main.bounds.width * 0.035) {//LOGINFORM
                        InputFieldView(
                            value: $emailValue,
                            placeholder:"Email",
                            icon: "envelope"
                        )
                        InputFieldView(
                            value: $passwordValue,
                            placeholder:"Password",
                            icon: "key"
                        )
                        ButtonView_2 (
                            action: {},
                            label: "Login",
                            color: Color(
                               red: 0.8627,
                               green: 0.8470,
                               blue: 0.7960
                            ),
                            opacity: 1.0,
                            isBorder: false
                        ).padding()
                    }.padding()//:LOGINFORM
                    Spacer()
                    VStack(alignment: .leading) {//FOOTER
                        Text("Don't have an account yet?")
                        ButtonView_2(
                            action: {
                                self.isSignUpActive = true
                            },
                            label: "Sign up",
                            color: Color (
                                red: 0.78,
                                green: 0.74,
                                blue: 0.62
                            ),
                            opacity: 1.0,
                            isBorder: false
                        )
                    }.padding()//:FOOTER
                    
                }//:BODY
                
            }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)//:ZSTACK
        }.navigationViewStyle(.stack)//:NAVIGATION
    }
}
 
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
