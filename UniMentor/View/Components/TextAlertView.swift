//
//  TextAlertView.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-11.
//

import SwiftUI

struct TextAlertView: View {
    @Binding var text: String
    var body: some View {
        Text(text)
            .font(
                Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035)
            ).foregroundColor(Color.red)
    }
}

struct TextAlertView_Preview: View {
    @State var text = "Hello world"
    var body: some View {
        TextAlertView(text: $text)
    }
}

struct TextAlertView_Previews: PreviewProvider {
    static var previews: some View {
        TextAlertView_Preview()
    }
}
