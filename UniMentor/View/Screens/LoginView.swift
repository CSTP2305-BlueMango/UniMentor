//
//  LoginView.swift
//  UniMentor
//
//  Created by Sovereign of solitude on 2022-05-24.

import SwiftUI

/// user login
struct LoginView: View {
    
    /// state for keeping track of if link to signup is active
    @State var isSignUpActive = false
    
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject private var loginVM = LoginViewModel()
    
    /// login function
    func handleLogin() {
        loginVM.signIn {
            viewModel.loggedIn = loginVM.isLoginSuccess
        }
    }
    
    var body: some View {
        // ZSTACK
        ZStack {
            // BACKGROUND
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
                //LOGINFORM
                VStack(spacing: UIScreen.main.bounds.width * 0.015) {
                    InputFieldView(
                        value: $loginVM.email,
                        placeholder:"sample@gmail.com",
                        icon: "envelope.fill",
                        title: "Email",
                        errorMessage: $loginVM.emailError
                    ).autocapitalization(.none)
                    InputFieldView(
                        value: $loginVM.password,
                        placeholder:"PrancingPonies123",
                        icon: "key.fill",
                        title: "Password",
                        inputType: "password",
                        errorMessage: $loginVM.passwordError
                    ).autocapitalization(.none)
                    Spacer()
                    ButtonView_2 (
                        action: {
                            handleLogin()
                        },
                        label: "Login",
                        color: Color("TabBarColor"),
                        opacity: 1.0,
                        isBorder: false
                    ).padding()
                }
                .frame(height: UIScreen.main.bounds.height * 0.36)
                //:LOGINFORM
                Spacer()
                Spacer()
                //FOOTER
                VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.01) {
                    VStack(alignment: .trailing) {
                        Text("Don't have an account yet?")
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                    }
                    .padding(EdgeInsets(top: 0, leading: UIScreen.main.bounds.width * 0.02, bottom: 0, trailing: 0))
                    // SIGNUP BUTTON
                    ButtonView_2(
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
                }//:FOOTER
            }
            .frame(height: UIScreen.main.bounds.height * 0.85)
            //:BODY
        }
        .hideNavigationBar()
        //:ZSTACK
    }
}

struct LoginViewPreview_Previews: View {
    @State var isLoginActive: Bool = false
    var body: some View {
        LoginView()
    }
}
 
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewPreview_Previews()
    }
}
