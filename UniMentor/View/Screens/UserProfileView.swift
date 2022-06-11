//
//  UserProfile.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

struct UserProfile: View {
    var body: some View {
        NavigationView {
            // BODY
            VStack(alignment: .trailing, spacing: UIScreen.main.bounds.height * 0.02) {
                // MAIN
                VStack {
                    Spacer()
                    ZStack {
//                        NavigationLink(destination: RequestsProfileView()) {
//                            // Text("test")
//                            Image(systemName: "gearshape")
//                                .resizable()
//                                .scaledToFit()
//                                .foregroundColor(Color.black)
//                        }
                    }.frame(width: UIScreen.main.bounds.width * 0.06, height: UIScreen.main.bounds.height * 0.05)
                        .padding(EdgeInsets(top: 0, leading: UIScreen.main.bounds.width * 0.8, bottom: UIScreen.main.bounds.height * 0.08, trailing: 0))
                    ProfileView()
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: UIScreen.main.bounds.height * 0.08, trailing: 0))
                    Spacer()
                } //: MAIN
                .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.65)
                    .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                // FOOTER
                VStack(spacing: UIScreen.main.bounds.height * 0.01) {
                    Text("Matched students")
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                    Text("\(10)")
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                } //: FOOTER
                .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.1)
                    .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
            } //: BODY
            .frame(height: UIScreen.main.bounds.height * 0.1)
        } //: NAV_VIEW
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
