//
//  MultiLineInputView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-15.
//

import SwiftUI

struct MultiLineInputView: View {
    /// input value
    @Binding var value: String
    /// error message
    @Binding var errorMessage: String?
    
    var body: some View {
        // MULTILINE INPUT FIELDS
        // reference: https://stackoverflow.com/questions/62741851/how-to-add-placeholder-text-to-texteditor-in-swiftui
        VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.02)  {
            HStack {
                // INPUT TITLE
                VStack(alignment: .leading) {
                    Text("Information")
                        .font(Font.custom( "TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                        .padding(.leading, UIScreen.main.bounds.width * 0.03)
                        .foregroundColor(Color("DarkColor"))
                }.frame(width: UIScreen.main.bounds.width * 0.34, height: UIScreen.main.bounds.height * 0.02, alignment: .leading)
                Spacer()
                // ERROR MESSAGE
                VStack(alignment: .trailing) {
                    if let errorMessage = errorMessage {
                        Text(errorMessage).font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04)).foregroundColor(Color("ErrorColor")).frame(width: UIScreen.main.bounds.width * 0.52, alignment: .trailing)
                    }
                }.frame(height: UIScreen.main.bounds.height * 0.015).padding(.trailing, UIScreen.main.bounds.width * 0.02)
            }
            // INPUT FIELD
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                TextEditor(text: $value)
                    .padding(EdgeInsets(top: UIScreen.main.bounds.width * 0.03, leading: UIScreen.main.bounds.width * 0.05, bottom: UIScreen.main.bounds.width * 0.03, trailing: UIScreen.main.bounds.width * 0.05))
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045))
                // reference:  https://stackoverflow.com/questions/60374653/swiftui-textfield-height-didnt-change
                }
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.21)
                .background(Color.white)
                .cornerRadius(UIScreen.main.bounds.width * 0.04)
                .shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.9)
        .padding(.top, UIScreen.main.bounds.height * 0.005)

    }
}

struct MultiLineInputViewPreviewView: View {
    @State var inputValue: String = ""
    @State var error: String? = ""
    var body: some View {
        MultiLineInputView(
            value: $inputValue,
            errorMessage: $error
        )
    }
    
}

struct MultiLineInputView_Previews: PreviewProvider {
    static var previews: some View {
        MultiLineInputViewPreviewView()
    }
}
