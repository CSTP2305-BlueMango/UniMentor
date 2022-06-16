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
    var title: String
    var errorMessage: String
    var body: some View {
        VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.01) {
            HStack(alignment: .center) {
                // input title
                VStack(alignment: .leading) {
                    Text("\(title)")
                        .font(Font.custom( "TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                        .padding(.leading, UIScreen.main.bounds.width * 0.03)
                        .foregroundColor(Color("DarkColor"))
                }.frame(width: UIScreen.main.bounds.width * 0.34, height: UIScreen.main.bounds.height * 0.02, alignment: .leading)
                Spacer()
                // error message
                VStack(alignment: .trailing) {
                    Text("\(errorMessage)").font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04)).foregroundColor(Color("ErrorColor")).frame(width: UIScreen.main.bounds.width * 0.52, alignment: .trailing)
                }.frame(height: UIScreen.main.bounds.height * 0.015).padding(.trailing, UIScreen.main.bounds.width * 0.02)
            }
            HStack {
                if let icon = icon {
                    Image(systemName: icon)
                        .foregroundColor(
                            Color(red: 0.835, green: 0.835, blue: 0.844))
                        .font(.system(size: UIScreen.main.bounds.width * 0.04))
                }
                TextField(placeholder, text: $value)
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045))
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.07)
            .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.04).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
        }.frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.1)
    }
}

struct newPreviewView: View {
    @State var inputValue: String = ""
    var body: some View {
        InputFieldView(
            value: $inputValue,
            placeholder:"Email",
            title: "Email",
            errorMessage: "test"
        )
    }
    
}

struct InputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        newPreviewView()
    }
}
