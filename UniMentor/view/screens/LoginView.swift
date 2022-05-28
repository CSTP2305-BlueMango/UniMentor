//
//  LoginView.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-05-24.
//

import SwiftUI

struct LoginView: View {
    @State var inputValue: String = ""
    var body: some View {
        ZStack {
            Image("Login")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 150) {
                Text("Login").font(.system(size: 60))
                VStack(spacing: 35) {
                    InputView(
                        value: $inputValue,
                        placeholder:"Email",
                        icon: "envelope"
                    )
                    InputView(
                        value: $inputValue,
                        placeholder:"Password",
                        icon: "key"
                    )
                    ButtonView(
                        action: {},
                        label: "Login",
                        color: Color(
                            red: 0.86,
                            green: 0.85,
                            blue: 0.80
                        )
                    )
                }.padding()
                VStack {
                    Text("Don't have an account yet?")
                    ButtonView(
                        action: {},
                        label: "Sign up",
                        color: Color (
                            red: 0.78,
                            green: 0.74,
                            blue: 0.62
                        )
                    )
                }
            }
        }
    }
}
 
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
