//
//  HomeCardView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-17.
//

import SwiftUI

struct HomeCardView: View {
    @State var cardHeight: Double = 0.1
    @State var isButtonClicked: Bool = false
    
    var body: some View {
        // MAIN
        VStack(spacing: UIScreen.main.bounds.width * 0.02) {
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
                }.frame(width: UIScreen.main.bounds.width * 0.55)
                // RIGHT - Button
                ZStack {
                    Button(action: {
                        if !isButtonClicked {
                            cardHeight = 0.2
                        } else {
                            cardHeight = 0.1
                        }
                        isButtonClicked = !isButtonClicked
                    }) {
                        Image(systemName: "chevron.down")
                            .font(.system(size: UIScreen.main.bounds.width * 0.05))
                    }
                }.frame(width: UIScreen.main.bounds.width * 0.13)
            }
            if isButtonClicked {
                Divider()
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    .background(Color("LightColor"))
                VStack() {
                    Text("""
    I guess we could discuss the implications of the phrase meant to be.

    That is if we wanted to drown ourselves in a sea of backwardly referential semantics and other mumbo-jumbo.
    Test
    """
                    )
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                    .multilineTextAlignment(.leading)
                }.padding(EdgeInsets(top: 0, leading: UIScreen.main.bounds.width * 0.04, bottom: 0, trailing: UIScreen.main.bounds.width * 0.04))
                        .frame(height: UIScreen.main.bounds.height * 0.07)
            }
        } //: MAIN
        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * cardHeight)
        .background(Color.white.cornerRadius(UIScreen.main.bounds.width * 0.04))
        .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
        .buttonStyle(.bordered)
        .clipShape(RoundedRectangle(cornerRadius: 16)).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0)
    }
}

struct HomeCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCardView()
    }
}
