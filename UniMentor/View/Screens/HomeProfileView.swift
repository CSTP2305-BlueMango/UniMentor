//
//  HomeProfileView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

struct HomeProfileView: View {
    var body: some View {
        VStack(alignment: .trailing) {
            VStack {
                Spacer()
                ProfileView()
                VStack{
                    ButtonView_2(action: {},
                         label: "Request for match",
                         color: Color(red: 0.7803, green: 0.7176, blue: 0.6196),
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

struct HomeProfileView_Previews: PreviewProvider {
    static var previews: some View {
        HomeProfileView()
    }
}
