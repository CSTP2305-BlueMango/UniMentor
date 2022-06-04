//
//  LoginView.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-05-24.
//

import SwiftUI

struct LoginView: View {
    @State var emailValue: String = ""
    @State var passwordValue: String = ""
    var body: some View {
        ZStack {
            Color(red: 0.6235, green: 0.5450, blue: 0.4235)
                .ignoresSafeArea()
            VStack() {
                Spacer()
                //Header
                Text("Login")
                    .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.15))
                Spacer()
                VStack(spacing: UIScreen.main.bounds.width * 0.035) {
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
                }.padding()
                Spacer()
                Spacer()
                VStack(alignment: .leading) {
                    Text("Don't have an account yet?")
                    ButtonView_2(
                        action: {},
                        label: "Sign up",
                        color: Color (
                            red: 0.78,
                            green: 0.74,
                            blue: 0.62
                        ),
                        opacity: 1.0,
                        isBorder: false
                    )
                }.padding()
            }
        }
    }
}
 
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
