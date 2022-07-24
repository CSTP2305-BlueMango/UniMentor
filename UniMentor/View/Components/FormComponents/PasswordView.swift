//
//  PasswordView.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-11.
//

import SwiftUI

/// password input field view component
/// param: place holder, input valie
struct PasswordView: View {
    /// input placeholder
    var placeholder: String
    /// input value
    @Binding var text: String
    /// text visibility state
    @State var isTextVisible: Bool = false
    
    /// change visibility
    private func toggleTextVisible() {
        isTextVisible = !isTextVisible
    }
    
    /// change visibility icon
    private func getVisibleicon()->String {
        if isTextVisible { return "eye.slash" }
        return "eye"
    }
    
    var body: some View {
        HStack {
            // Input field
            if !isTextVisible {
                SecureField(placeholder, text: $text)
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045))
            } else {
                TextField(placeholder, text: $text)
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045))
            }
            // Visibility icon
            Image(systemName: getVisibleicon())
                .onTapGesture { toggleTextVisible() }
                .foregroundColor(Color(red: 0.835,green: 0.835,blue: 0.844))
                .frame(width: UIScreen.main.bounds.width * 0.05)
        }//: HSTACK
    }
}

struct PasswordView_Preview: View {
    @State var value: String = ""
    var body: some View {
        PasswordView(placeholder: "Password",text: $value)
    }
}

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
       PasswordView_Preview()
    }
}
