//
//  SignUpView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-05-28.
//

import SwiftUI

/// signup view
struct SignUpView: View {
    
    //ref:https://www.cuvenx.com/post/swiftui-pop-to-root-view
    @Environment(\.presentationMode) var presentation
    
    @EnvironmentObject var viewModel: AppViewModel
    
    @ObservedObject private var signupVM = SignupViewModel()
    
    //state for keeping track of if link to profileinfo view is active
    @State var isProfileInfoActive = false
    
    func handleSignup() {
        //reset error state after each submit
        signupVM.signUp()
    }
    
    var body: some View {
        // ZSTACK
        ZStack {
            // BACKGROUND
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            // NAVIGATIONLINK
            NavigationLink(
                destination: ProfileInfoView(),
                isActive: $isProfileInfoActive
            ) {
                EmptyView()
            }
            //:NAVIGATIONLINK
            
            // BODY
            VStack(alignment: .center) {
                // HEADER
                VStack(alignment: .center) {
                    Text("Sign Up")
                        .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.15))
                } //: HEADER
                Spacer()
                // MAIN
                VStack(spacing: UIScreen.main.bounds.width * 0.015) {
                    // INPUT FIELDS
                    // email input
                    InputFieldView(
                        value: $signupVM.email,
                        placeholder:"sample@gmail.com",
                        icon: "envelope.fill",
                        title: "Email",
                        errorMessage: $signupVM.emailError
                    ).autocapitalization(.none)
                    // name input
                    InputFieldView(
                        value: $signupVM.name,
                        placeholder:"John Doe",
                        icon: "person.fill",
                        title: "Name",
                        errorMessage: Binding.constant(nil)
                    )
                    // password input
                    InputFieldView(
                        value: $signupVM.password,
                        placeholder:"PrancingPonies123",
                        icon: "key.fill",
                        title: "Password",
                        inputType: "password",
                        errorMessage: $signupVM.passwordError
                    ).autocapitalization(.none)
                    // confirm password input
                    InputFieldView(
                        value: $signupVM.confirmPassword,
                        placeholder:"PrancingPonies123",
                        icon: "key.fill",
                        title: "Confirm Password",
                        inputType: "password",
                        errorMessage: $signupVM.confirmError
                    ).autocapitalization(.none)
                    Spacer()
                    
                    // BUTTON - signup
                    ButtonView_2(action: {
                        handleSignup()
                    },
                         label: "Sign Up",
                         color: Color("TabBarColor"),
                         opacity: 1.0,
                         isBorder: false
                    )
                } //: MAIN
                .frame(height: UIScreen.main.bounds.height * 0.55)
                Spacer()
                Spacer()
                // FOOTER
                VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.01) {
                    // go to login text
                    VStack(alignment: .trailing) {
                        Text("Already have an account?")
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                    }
                    .padding(EdgeInsets(top: 0, leading: UIScreen.main.bounds.width * 0.02, bottom: 0, trailing: 0))
                    // BUTTON - login
                    ButtonView_2(action: {
                        // pop child view to go back to root view
                        presentation.wrappedValue.dismiss()
                    },
                         label: "Log In",
                         color: Color(
                            red: 1,
                             green: 1,
                             blue: 1
                         ),
                         opacity: 0.0,
                         isBorder: true
                    )
                } //: FOOTER
            }
            .frame(height: UIScreen.main.bounds.height * 0.85)
        }//: ZSTACK
        .hideNavigationBar()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
