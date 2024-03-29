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
    /// app view model object
    @EnvironmentObject var viewModel: AppViewModel
    /// login view model object
    @ObservedObject private var loginVM = LoginViewModel()
    
    var body: some View {
        // ZSTACK
        ZStack {
            // BACKGROUND
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            // NAVIGATION LINK - navigate to sign up
            NavigationLink(
                destination: SignUpView(),
                isActive: $isSignUpActive
            ) {EmptyView()}
            
            //BODY
            VStack() {
                // HEADER
                VStack(alignment: .center) {
                    // Title
                    Text("Login")
                        .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.15))
                } //: HEADER
                Spacer()
                //LOGINFORM
                VStack(spacing: UIScreen.main.bounds.width * 0.015) {
                    // Email input
                    InputFieldView(
                        value: $loginVM.email,
                        placeholder:"sample@gmail.com",
                        icon: "envelope.fill",
                        title: "Email",
                        errorMessage: $loginVM.emailError
                    ).autocapitalization(.none)
                    // Login input
                    InputFieldView(
                        value: $loginVM.password,
                        placeholder:"PrancingPonies123",
                        icon: "key.fill",
                        title: "Password",
                        inputType: "password",
                        errorMessage: $loginVM.passwordError
                    ).autocapitalization(.none)
                    Spacer()
                    // Button - login user and go to Home view
                    ButtonView (
                        action: {
                            loginVM.signIn {
                                viewModel.loggedIn = loginVM.isLoginSuccess
                            }
                        },
                        label: "Login",
                        color: Color("TabBarColor")
                    ).padding()
                }.frame(height: UIScreen.main.bounds.height * 0.36)
                //:LOGINFORM
                Spacer()
                Spacer()
                //FOOTER
                VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.01) {
                    VStack(alignment: .trailing) {
                        Text("Don't have an account yet?")
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                    }.padding(.leading, UIScreen.main.bounds.width * 0.02)
                    // Signup button - go to sign up view
                    ButtonView(
                        action: {
                            self.isSignUpActive = true
                        },
                        label: "Sign up",
                        isBorder: true
                    )
                }
                //:FOOTER
            }.frame(height: UIScreen.main.bounds.height * 0.85)
            //:BODY
        }.hideNavigationBar()
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
