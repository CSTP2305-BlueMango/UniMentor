//
//  InputFieldView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-05-28.
//

import SwiftUI

struct InputFieldView: View {
    @Binding var value: String
    var placeholder: String
    var icon: String?
    var body: some View {
        HStack {
            if let icon = icon {
                Image(systemName: icon)
                    .foregroundColor(
                        Color(
                            red: 0.835,
                            green: 0.835,
                            blue: 0.844))
                    .frame(width: 20)
            }
            TextField(placeholder, text: $value)
                .padding(.leading, 0)
                .font(Font.custom("TimesNewRomanPSMT", size: 20))
        }
        .padding()
        .frame(height: 60)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
    }
}

struct newPreviewView: View {
    @State var inputValue: String = ""
    var body: some View {
        InputFieldView(
            value: $inputValue,
            placeholder:"Email"
        )
    }
    
}

struct InputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        newPreviewView()
    }
}
