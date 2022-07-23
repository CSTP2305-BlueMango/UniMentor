//
//  BackButtonView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-23.
//

import SwiftUI

struct BackButtonView: View {
    /// button action
    var action: ()->Void
    
    var body: some View {
        HStack {
            // Back button
            Button(action: action)
            {
                // Button label
                Image(systemName: "chevron.backward")
                    .foregroundColor(.black)
                    .font(.system(size: UIScreen.main.bounds.width * 0.06))
            }
            Spacer()
        }.frame(width: UIScreen.main.bounds.width * 0.9)
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView(
            action: {}
        )
    }
}
