//
//  SmallButtonView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

struct SmallButtonView: View {
    let action: ()->Void
    let label: String
    let color: Color
    let width: Double
    let height: Double
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .padding(0)
                .frame(width: width, height: height)
                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.06))
        }
        .background(color.cornerRadius(UIScreen.main.bounds.width * 0.04).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
        .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
        .buttonStyle(.bordered)
    }
}

struct SmallButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SmallButtonView(
            action: {},
            label: "test",
            color: Color(
                red: 0.86,
                green: 0.85,
                blue: 0.80
            ),
            width: UIScreen.main.bounds.width * 0.85,
            height: UIScreen.main.bounds.height * 0.05
        )
    }
}
