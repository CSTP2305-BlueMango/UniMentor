//
//  RequestsProfileView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

struct RequestsProfileView: View {
    var body: some View {
        VStack(alignment: .trailing) {
            VStack {
                Spacer()
                ProfileView()
                VStack{
                    ButtonView_2(action: {print("test")},
                         label: "Accept Request",
                         color: Color("ButtonColor"),
                         opacity: 1.0,
                         isBorder: false
                    )
                }
                Spacer().frame(height: UIScreen.main.bounds.height * 0.02)
            }
            .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.72)
                .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
        }
        .frame(height: UIScreen.main.bounds.height * 1)
    }
}

struct RequestsProfileView_Previews: PreviewProvider {
    static var previews: some View {
        RequestsProfileView()
    }
}
