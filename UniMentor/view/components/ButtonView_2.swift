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
    var body: some View {
        Button(action: action) {
            Text(label)
                .padding(0)
                .frame(width: 355, height: 50)
                .font(Font.custom("TimesNewRomanPSMT", size: 25))
        }
        .background(color.cornerRadius(20).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
        .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
        .buttonStyle(.bordered)
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
            )
        )
    }
}
