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
    //get presentation mode object - presentation mode object is for poping child view from NavigationView stack
    @Environment(\.presentationMode) var presentation
    
    /// state for keeping track of if link to profileinfo view is active
    @State var isProfileInfoActive = false
    
    /// signup email
    @State var email: String = ""
    /// signup name
    @State var name: String = ""
    /// signup password
    @State var password: String = ""
    /// signup confirm password
    @State var confirmPassword: String = ""
    
    /// signup email error message
    @State var emailError: String? = ""
    /// signup name error message
    @State var nameError: String? = ""
    /// signup password error message
    @State var passwordError: String? = ""
    /// signup confirm password error message
    @State var passwordConfirmError: String? = ""
    
    func handleSignup() {
        // reset error state after each submit
        emailError = ""
        passwordConfirmError = ""
        passwordError = ""
        
        //validate email
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        guard emailPredicate.evaluate(with: email) else {
            emailError = "Invalid email"
            return
        }
        
        //validate password
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@","^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
        guard passwordPredicate.evaluate(with: password) else {
            passwordError = "password need 8 letters mininum, contains 1 uppercase and number"
            return
        }
        
        guard password == confirmPassword else {
            passwordConfirmError = "Password does not match"
            return
        }
        self.isProfileInfoActive = true
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
                        value: $email,
                        placeholder:"sample@gmail.com",
                        icon: "envelope.fill",
                        title: "Email",
                        errorMessage: $emailError
                    ).autocapitalization(.none)
                    // name input
                    InputFieldView(
                        value: $name,
                        placeholder:"John Doe",
                        icon: "person.fill",
                        title: "Name",
                        errorMessage: $nameError
                    )
                    // password input
                    InputFieldView(
                        value: $password,
                        placeholder:"PrancingPonies123",
                        icon: "key.fill",
                        title: "Password",
                        inputType: "password",
                        errorMessage: $passwordError
                    ).autocapitalization(.none)
                    // confirm password input
                    InputFieldView(
                        value: $confirmPassword,
                        placeholder:"PrancingPonies123",
                        icon: "key.fill",
                        title: "Confirm Password",
                        inputType: "password",
                        errorMessage: $passwordConfirmError
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
            //: BODY
        }.navigationBarHidden(true)
         .navigationBarBackButtonHidden(true)
        //: ZSTACK
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
