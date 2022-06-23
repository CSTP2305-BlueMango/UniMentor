//
//  MessageCardView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-17.
//

import SwiftUI

struct MessageCardView: View {
    // TODO: get student object or student info
    var isEditClicked: Bool = false
    @State var isOn1: Bool = false
    
    var body: some View {
        // MAIN
        HStack {
            if isEditClicked {
                Button(action: {
                    
                    isOn1 = !isOn1
                }) {
                    HStack {
                        // reference: https://swiftuirecipes.com/blog/custom-toggle-checkbox-in-swiftui
                        Toggle("", isOn: $isOn1)
                          .toggleStyle(CheckboxToggleStyle(style: .circle))
                          .foregroundColor(.blue)
                        // CARD
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
                                    .frame(width: UIScreen.main.bounds.width * 0.65, alignment: .leading)
                                Text("Hello, This is from latest text that user recieved from First Lastname user. It is nice to talk to you.")
                                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                                    .foregroundColor(Color.gray)
                                    .lineLimit(2)
                            }.frame(width: UIScreen.main.bounds.width * 0.65)
                            Spacer()
                        } //: CARD
                        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.1)
                        .background(Color.white.cornerRadius(UIScreen.main.bounds.width * 0.04))
                        .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                        .buttonStyle(.bordered)
                        .clipShape(RoundedRectangle(cornerRadius: 16)).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0)
                    }
                    .frame(width: UIScreen.main.bounds.width * 1).padding(.leading, UIScreen.main.bounds.width * 0.12)
                }
            } else {
                // CARD
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
                            .frame(width: UIScreen.main.bounds.width * 0.65, alignment: .leading)
                        Text("Hello, This is from latest text that user recieved from First Lastname user. It is nice to talk to you.")
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                            .foregroundColor(Color.gray)
                            .lineLimit(2)
                    }.frame(width: UIScreen.main.bounds.width * 0.65)
                    Spacer()
                } //: CARD
                .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.1)
                .background(Color.white.cornerRadius(UIScreen.main.bounds.width * 0.04))
                .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                .buttonStyle(.bordered)
                .clipShape(RoundedRectangle(cornerRadius: 16)).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0)
            }
        } //: MAIN
    }
}

struct MessageCardView_Previews: PreviewProvider {
    static var previews: some View {
        MessageCardView(
            isEditClicked: false
        )
    }
}
