//
//  SignUpView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-05-28.
//

import SwiftUI

/// user signup
struct SignUpView: View {
    /// profileInfoView active state
    @State var isProfileInfoActive = false
    /// app view model object
    @EnvironmentObject var viewModel: AppViewModel
    /// signup view model object
    @ObservedObject private var signupVM = SignupViewModel()
    
    //ref:https://www.cuvenx.com/post/swiftui-pop-to-root-view
    /// view presentation mode
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        // ZSTACK
        ZStack {
            // BACKGROUND
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            // NAVIGATIONLINK - navigate to profile information view
            NavigationLink(
                destination: ProfileInfoView(name: signupVM.name),
                isActive: $isProfileInfoActive
            ) {EmptyView()}
            
            // BODY
            VStack(alignment: .center) {
                // HEADER
                VStack(alignment: .center) {
                    // Title
                    Text("Sign Up")
                        .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.15))
                } //: HEADER
                Spacer()
                // MAIN
                VStack(spacing: UIScreen.main.bounds.width * 0.015) {
                    // INPUT FIELDS
                    // Email input
                    InputFieldView(
                        value: $signupVM.email,
                        placeholder:"sample@gmail.com",
                        icon: "envelope.fill",
                        title: "Email",
                        errorMessage: $signupVM.emailError
                    ).autocapitalization(.none)
                    // Name input
                    InputFieldView(
                        value: $signupVM.name,
                        placeholder:"John Doe",
                        icon: "person.fill",
                        title: "Name",
                        errorMessage: $signupVM.nameError
                    )
                    // Password input
                    InputFieldView(
                        value: $signupVM.password,
                        placeholder:"PrancingPonies123",
                        icon: "key.fill",
                        title: "Password",
                        inputType: "password",
                        errorMessage: $signupVM.passwordError
                    ).autocapitalization(.none)
                    // Confirm passworkd view
                    InputFieldView(
                        value: $signupVM.confirmPassword,
                        placeholder:"PrancingPonies123",
                        icon: "key.fill",
                        title: "Confirm Password",
                        inputType: "password",
                        errorMessage: $signupVM.confirmError
                    ).autocapitalization(.none)
                    Spacer()
                    
                    // Signup Button - Sign up user and go to profile information view
                    ButtonView(action: {
                        signupVM.signUp {
                            isProfileInfoActive = true
                        }
                    },
                         label: "Sign Up",
                         color: Color("TabBarColor")
                    )
                }.frame(height: UIScreen.main.bounds.height * 0.55)
                //: MAIN
                Spacer()
                Spacer()
                // FOOTER
                VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.01) {
                    // BUTTON MESSAGE
                    VStack(alignment: .trailing) {
                        Text("Already have an account?")
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                    }
                    .padding(EdgeInsets(top: 0, leading: UIScreen.main.bounds.width * 0.02, bottom: 0, trailing: 0))
                    // Login button - go to login view
                    ButtonView(action: {
                        // pop child view to go back to login view
                        presentation.wrappedValue.dismiss()
                    },
                         label: "Log In",
                         isBorder: true
                    )
                } //: FOOTER
            }.frame(height: UIScreen.main.bounds.height * 0.85)
        }.hideNavigationBar()
        //: ZSTACK
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
