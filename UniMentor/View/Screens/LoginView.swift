//
//  LoginView.swift
//  UniMentor
//
//  Created by Sovereign of solitude on 2022-05-24.

import SwiftUI

struct LoginView: View {
    @State var loginEmail: String = ""
    @State var loginPassword: String = ""
    @State var loginEmailError: String? = ""
    @State var loginPasswordError: String? = ""
    
    //state for keeping track of if link to signup is active
    @State var isSignUpActive = false
    
    @EnvironmentObject var viewModel: AppViewModel
    
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
        
        viewModel.signIn(email: loginEmail, password: loginPassword)
    }
    
    var body: some View {
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
                        value: $loginEmail,
                        placeholder:"sample@gmail.com",
                        icon: "envelope.fill",
                        title: "Email",
                        errorMessage: $loginEmailError
                    ).autocapitalization(.none)
                    InputFieldView(
                        value: $loginPassword,
                        placeholder:"PrancingPonies123",
                        icon: "key.fill",
                        title: "Password",
                        inputType: "password",
                        errorMessage: $loginPasswordError
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
            }
            .frame(height: UIScreen.main.bounds.height * 0.85)
            //:BODY
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
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
