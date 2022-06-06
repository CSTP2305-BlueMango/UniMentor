//
//  SignUpView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-05-28.
//

import SwiftUI

struct SignUpView: View {
    
    @State var email: String = ""
    @State var name: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""

    var body: some View {
        ZStack {
            Color(red: 0.9490, green: 0.9411, blue: 0.9098)
                .ignoresSafeArea()
            Spacer()
            //Background_2()
            VStack(alignment: .center) {
                VStack(alignment: .center) {
                    Text("Sign Up")
                        .font(Font.custom("Charm-Regular", size: 60))
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 15) {
                    InputFieldView(
                        value: $email,
                        placeholder:"Email",
                        icon: "envelope"
                    )
                    InputFieldView(
                        value: $name,
                        placeholder:"Name",
                        icon: "envelope"
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
                    VStack(alignment: .center) {
                        ButtonView_2(action: {},
                             label: "Sign Up",
                             color: Color(
                                red: 0.8627,
                                green: 0.8470,
                                 blue: 0.7960
                             )
                        )
                    }.frame(height: 150)
                }.frame(height: 400)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                VStack(alignment: .leading) {
                    HStack(alignment: .bottom) {
                        Text("Already have an account?").font(Font.custom("TimesNewRomanPSMT", size: 15))
                    }.padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 0))
                    ButtonView_2(action: {},
                         label: "Log In",
                         color: Color(
                             red: 0.7803,
                             green: 0.7411,
                             blue: 0.6196
                         )
                    )
                }
            }.frame(height: 700)
                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
            
            
        }
    }

}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
