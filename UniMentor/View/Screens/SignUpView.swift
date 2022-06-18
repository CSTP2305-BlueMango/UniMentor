//
//  SignUpView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-05-28.
//

import SwiftUI

struct SignUpView: View {
    
    //ref:https://www.cuvenx.com/post/swiftui-pop-to-root-view
    //get presentation mode object - presentation mode object is for poping child view from NavigationView stack
    @Environment(\.presentationMode) var presentation
    
    //state for keeping track of if link to profileinfo view is active
    @State var isProfileInfoActive = false
    
    @State var email: String = ""
    @State var name: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            //NAVIGATIONLINK
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
                    InputFieldView(
                        value: $email,
                        placeholder:"sample@gmail.com",
                        icon: "envelope.fill",
                        title: "Email",
                        errorMessage: ""
                    )
                    InputFieldView(
                        value: $name,
                        placeholder:"John Doe",
                        icon: "person.fill",
                        title: "Name",
                        errorMessage: ""
                    )
                    InputFieldView(
                        value: $password,
                        placeholder:"PrancingPonies123",
                        icon: "key.fill",
                        title: "Password",
                        errorMessage: ""
                    )
                    InputFieldView(
                        value: $confirmPassword,
                        placeholder:"PrancingPonies123",
                        icon: "key.fill",
                        title: "Confirm Password",
                        errorMessage: ""
                    )
                    Spacer()
                    
                    // BUTTON - signup
                    ButtonView_2(action: {
                        self.isProfileInfoActive = true
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
                    VStack(alignment: .trailing) {
                        Text("Already have an account?")
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                    }
                    .padding(EdgeInsets(top: 0, leading: UIScreen.main.bounds.width * 0.02, bottom: 0, trailing: 0))
                    // BUTTON - login
                    ButtonView_2(action: {
                        //pop child view to go back to root view
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
            } //: BODY
            .frame(height: UIScreen.main.bounds.height * 0.85)
        }.navigationBarHidden(true)
         .navigationBarBackButtonHidden(true) //: ZSTACK
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
