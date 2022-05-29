//
//  ButtonView.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-05-27.
//

import SwiftUI

struct ButtonView: View {
    let action: ()->Void
    let label: String
    let color: Color
    var body: some View {
        Button(action: action) {
            Text(label)
                .padding([.leading, .trailing], 100)
                .padding([.top, .bottom], 15)
                .foregroundColor(
                    Color.black
                )
        }.background(color.opacity(0.8))
        .cornerRadius(20)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
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
