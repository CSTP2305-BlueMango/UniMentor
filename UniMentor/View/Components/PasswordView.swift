//
//  PasswordView.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-11.
//

import SwiftUI

struct PasswordView: View {
    var placeholder: String
    @Binding var text: String
    @State var isTextVisible: Bool = false
    
    func toggleTextVisible() {
        isTextVisible = !isTextVisible
    }
    
    func getVisibleicon()->String {
        if isTextVisible {
            return "eye.slash"
        }
        return "eye"
    }
    
    var body: some View {
        HStack {
            if !isTextVisible {
                SecureField(placeholder, text: $text)
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045))
            } else {
                TextField(placeholder, text: $text)
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045))
            }
            Image(systemName: getVisibleicon())
                .onTapGesture {
                    toggleTextVisible()
                }
                .foregroundColor(
                Color(
                    red: 0.835,
                    green: 0.835,
                    blue: 0.844))
                .frame(width: UIScreen.main.bounds.width * 0.05)
        }
    }
}

struct PasswordView_Preview: View {
    @State var value: String = ""
    var body: some View {
        PasswordView(placeholder: "Hello",text: $value)
    }
}

struct PasswordView_Previews: PreviewProvider {
    
    static var previews: some View {
       PasswordView_Preview()
    }
}
