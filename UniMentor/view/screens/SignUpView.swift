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
            Color(red: 0.7803, green: 0.7176, blue: 0.6196)
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
                VStack(spacing: UIScreen.main.bounds.width * 0.035) {
                    // INPUT FIELDS
                    InputFieldView(
                        value: $email,
                        placeholder:"Email",
                        icon: "envelope"
                    )
                    InputFieldView(
                        value: $name,
                        placeholder:"Name",
                        icon: "person"
                    )
                    InputFieldView(
                        value: $password,
                        placeholder:"Password",
                        icon: "key"
                    )
                    InputFieldView(
                        value: $confirmPassword,
                        placeholder:"Confirtm Password",
                        icon: "key"
                    )
                    Spacer()
                    
                    // BUTTON - signup
                    ButtonView_2(action: {
                        self.isProfileInfoActive = true
                    },
                         label: "Sign Up",
                         color: Color(red: 0.6235, green: 0.5450, blue: 0.4235),
                         opacity: 1.0,
                         isBorder: false
                    )
                    
                } //: MAIN
                .frame(height: UIScreen.main.bounds.height * 0.47)
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
            .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.85)
        }.navigationBarBackButtonHidden(true)
        .navigationBarHidden(true) //: ZSTACK
    }
}

//struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpView()
//    }
//}
