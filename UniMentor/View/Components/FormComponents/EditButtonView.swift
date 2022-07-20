//
//  EditButtonView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-16.
//

import SwiftUI

/// edit button component
struct EditButtonView: View {
    /// button title
    let title: String
    /// button action
    let action: ()->Void
    
    var body: some View {
        VStack {
            Button(action: action) {
                Text(title)
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                    .foregroundColor(Color.black)
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
