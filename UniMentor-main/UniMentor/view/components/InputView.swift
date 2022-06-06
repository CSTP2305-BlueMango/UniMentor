//
//  InputView.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-05-24.
//

import SwiftUI
struct InputView: View {
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
            }
            TextField(placeholder, text: $value)
        }
        .padding()
        .background(Color.white)
         .cornerRadius(20)
         .shadow(color: .gray, radius: 10)
    }
}

struct previewView: View {
    @State var inputValue: String = ""
    var body: some View {
        InputView(
            value: $inputValue,
            placeholder:"Email"
        )
    }
    
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        previewView()
    }
}
