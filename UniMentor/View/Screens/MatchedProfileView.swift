//
//  MatchedProfileView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

struct MatchedProfileView: View {
    var body: some View {
        VStack(alignment: .trailing) {
            VStack {
                Spacer()
                ProfileView()
                VStack{
                    ButtonView_2(action: {},
                         label: "Send Message",
                         color: Color("ButtonColor"),
                         opacity: 1.0,
                         isBorder: false
                    ).frame(width: UIScreen.main.bounds.width * 0.9, alignment: .trailing)
                }
                Spacer().frame(height: UIScreen.main.bounds.height * 0.02)
            }
            .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.72)
                .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
        }
        .frame(height: UIScreen.main.bounds.height * 1)
    }
}

struct MatchedProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedProfileView()
    }
}
