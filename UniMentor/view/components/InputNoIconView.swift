//
//  InputNoIconView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-05-28.
//

import SwiftUI

struct InputNoIconView: View {
    @Binding var value: String
    var placeholder: String
    var body: some View {
        HStack {
            TextField(placeholder, text: $value)
                .padding(.leading, 10)
                .font(Font.custom("TimesNewRomanPSMT", size: 20))
        }
        .padding()
        .frame(height: 60)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
    }
}

struct noIconPreviewView: View {
    @State var inputValue: String = ""
    var body: some View {
        InputNoIconView(
            value: $inputValue,
            placeholder:"Email"
        )
    }
    
}

struct InputNoIconView_Previews: PreviewProvider {
    static var previews: some View {
        noIconPreviewView()
    }
}
