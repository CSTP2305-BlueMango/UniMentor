//
//  HomeCard.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

struct ButtonCardView: View {
    // TODO: get student object or student info
    
    @State var color: Color
    @State var buttonText: String
    
    var body: some View {
        // MAIN
        HStack(spacing: UIScreen.main.bounds.width * 0.03) {
            // LEFT - Image
            Spacer().frame(width: 0)
            VStack {
                Image("user")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .shadow(radius: 3)
                    .frame(width: UIScreen.main.bounds.width * 0.18, height: UIScreen.main.bounds.width * 0.18)
            }
            // CENTER - Information
            VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.01) {
                Text("First Lastname")
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                    .lineLimit(1)
                    .frame(width: UIScreen.main.bounds.width * 0.5, alignment: .leading)
                Text("Computer Systems Technology")
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                    .lineLimit(1)
                Text("Vancouver Community College")
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.03))
                    .lineLimit(1)
            }.frame(width: UIScreen.main.bounds.width * 0.5)
            // RIGHT - Button
            ZStack {
                Button(action: {}) {
                    VStack(spacing: UIScreen.main.bounds.width * 0.01) {
                        Image("checkIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.06)
                            .padding(.top, -UIScreen.main.bounds.width * 0.01)
                        Text("\(buttonText)")
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                            .frame(width: UIScreen.main.bounds.width * 0.18)
                            .padding(0)
                    }.frame(height: UIScreen.main.bounds.height * 0.1)
                }
                .buttonStyle(.plain)
                .background(color)
                .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                .frame(width: UIScreen.main.bounds.width * 0.18)
            }
        } //: MAIN
        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.1)
        .background(Color.white.cornerRadius(UIScreen.main.bounds.width * 0.04))
        .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
        .buttonStyle(.bordered)
        .clipShape(RoundedRectangle(cornerRadius: 16)).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0)
    }
}

struct ButtonCardView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCardView(
            color: Color(red: 0.8627, green: 0.8313, blue: 0.7960),
            buttonText: "Accept"
        )
    }
}
