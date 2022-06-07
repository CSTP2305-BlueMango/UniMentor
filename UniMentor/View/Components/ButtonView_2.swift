//
//  ButtonView_2.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-05-28.
//

import SwiftUI

struct ButtonView_2: View {
    let action: ()->Void
    let label: String
    let color: Color
    let opacity: Double
    let isBorder: Bool
    
    var body: some View {
        if !isBorder {
            Button(action: action) {
                Text(label)
                    .padding(0)
                    .frame(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 0.05)
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.06))
            }
            .background(color.opacity(opacity).cornerRadius(UIScreen.main.bounds.width * 0.04).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
            .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
            .buttonStyle(.bordered)
            
        } else {
            Button(action: action) {
                HStack {
                    Text(label)
                        .padding(0)
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.065)
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.06))
                }
                .foregroundColor(Color.black)
                .buttonStyle(.bordered)
                .overlay(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.04).strokeBorder(Color.black, lineWidth: 1.2))
            }
        }
    }
}

struct ButtonView_2_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView_2(
            action: {},
            label: "test",
            color: Color(
                red: 0.86,
                green: 0.85,
                blue: 0.80
            ),
            opacity: 1.0,
            isBorder: false
        )
    }
}
