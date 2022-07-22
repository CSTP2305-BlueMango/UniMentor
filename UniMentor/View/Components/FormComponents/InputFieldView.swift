//
//  InputFieldView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-05-28.
//

import SwiftUI

/// input field component
/// param: input value, placeholder, icon image, input title, input type, error message
struct InputFieldView: View {
    /// input value
    @Binding var value: String
    /// input placeholder
    var placeholder: String
    /// input icon image (optional)
    var icon: String?
    /// input title
    var title: String
    /// input type ("text" - default, "password")
    var inputType: String = "text"
    /// error message
    @Binding var errorMessage: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.01) {
            // title & error message
            HStack(alignment: .center) {
                // input title
                VStack(alignment: .leading) {
                    Text(title)
                        .font(Font.custom( "TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                        .padding(.leading, UIScreen.main.bounds.width * 0.03)
                        .foregroundColor(Color("DarkColor"))
                }.frame(width: UIScreen.main.bounds.width * 0.34, height: UIScreen.main.bounds.height * 0.02, alignment: .leading)
                Spacer()
                // error message
                VStack(alignment: .trailing) {
                    if let errorMessage = errorMessage {
                        Text(errorMessage).font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04)).foregroundColor(Color("ErrorColor")).frame(width: UIScreen.main.bounds.width * 0.52, alignment: .trailing)
                    }
                }.frame(height: UIScreen.main.bounds.height * 0.015).padding(.trailing, UIScreen.main.bounds.width * 0.02)
            }//: title & error message
            // input field
            HStack {
                // icon
                if let icon = icon {
                    Image(systemName: icon)
                        .foregroundColor(
                            Color(red: 0.835, green: 0.835, blue: 0.844))
                        .font(.system(size: UIScreen.main.bounds.width * 0.04))
                }
                // password input type
                if inputType == "password" {
                    PasswordView(placeholder: placeholder, text: $value)
                }
                // text input type
                else {
                    TextField(placeholder, text: $value)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045))
                }
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.07)
            .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.04).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
            //: input field
        }.frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.1)
        //: VSTACK
    }
}

struct newPreviewView: View {
    @State var inputValue: String = ""
    @State var error: String? = ""
    var body: some View {
        InputFieldView(
            value: $inputValue,
            placeholder:"test",
            icon: "house.fill",
            title: "Email",
            errorMessage: $error
        )
    }
}

struct InputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        newPreviewView()
    }
}
