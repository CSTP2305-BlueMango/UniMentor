//
//  EditButtonView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-16.
//

import SwiftUI

struct EditButtonView: View {
    let title: String
    let action: ()->Void
    
    var body: some View {
        VStack {
            Button(action: action) {
                Text("\(title)")
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                    // .foregroundColor(Color.black)
            }
        }
    }
}

struct EditButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EditButtonView(
            title: "Test",
            action: {}
        )
    }
}
