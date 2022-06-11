//
//  LoginView.swift
//  UniMentor
//
//  Created by Sovereign of solitude on 2022-05-24.

import SwiftUI

struct LoginView: View {
    @State var loginEmail: String = ""
    @State var loginPassword: String = ""
    @State var loginEmailError: String = ""
    @State var loginPasswordError: String = ""
    
    //state for keeping track of if link to signup is active
    @State var isSignUpActive = false
    
    func handleLogin() {
        //reset error message state before each submit
        loginEmailError = ""
        loginPasswordError = ""
        
        //validate email
        //email regex ref: https://www.hackingwithswift.com/forums/swiftui/what-is-a-good-practice-to-handle-textfield-validations/5868
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        guard emailPredicate.evaluate(with: loginEmail) else {
            loginEmailError = "Invalid email"
            return
        }
        
        //validate password
        //password regex ref: https://medium.com/swlh/password-validation-in-swift-5-3de161569910va
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@","^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
        guard passwordPredicate.evaluate(with: loginPassword) else {
            loginPasswordError = "Invalid password"
            return
        }
        
    }
    
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
                        if (!loginEmailError.isEmpty) {
                            HStack {
                                TextAlertView(text: $loginEmailError)
                            }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading)
                        }
                        InputFieldView(
                            value: $loginEmail,
                            placeholder:"Email",
                            icon: "envelope"
                        )
                        if (!loginPasswordError.isEmpty) {
                            HStack {
                                TextAlertView(text: $loginPasswordError)
                            }.frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                        }
                        InputFieldView(
                            value: $loginPassword,
                            placeholder:"Password",
                            icon: "key",
                            inputType: "password"
                        )
                        ButtonView (
                            action: {
                                handleLogin()
                            },
                            label: "Login",
                            color: Color(red: 0.6235, green: 0.5450, blue: 0.4235),
                            opacity: 1.0,
                            isBorder: false
                        ).padding()
                    }.padding()//:LOGINFORM
                    Spacer()
                    VStack(alignment: .leading) {//FOOTER
                        Text("Don't have an account yet?")
                        ButtonView(
                            action: {
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
