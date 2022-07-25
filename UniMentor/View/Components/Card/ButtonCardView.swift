//
//  HomeCard.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

/// user card with button component
/// param: button action, user image, name, major, school
struct ButtonCardView: View {
    /// button action
    @State var action: ()->Void
    /// user image
    @State var image: String
    /// user name
    @State var name: String
    /// user major
    @State var major: String
    /// user school
    @State var school: String
    
    var body: some View {
        // MAIN
        HStack(spacing: UIScreen.main.bounds.width * 0.03) {
            // LEFT - Image
            Spacer().frame(width: 0)
            VStack {
                AsyncImage(url: URL(string: "\(image)")) {image in image
                    .resizable()
                    .cornerRadius(50)
                    .aspectRatio(contentMode: .fill)
                }placeholder: {
                    ProgressView()
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.18, height: UIScreen.main.bounds.width * 0.18)
            .clipShape(Circle())
            .shadow(radius: 3)
            // CENTER - Information
            VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.01) {
                // user name
                Text(name)
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                    .lineLimit(1)
                    .frame(width: UIScreen.main.bounds.width * 0.5, alignment: .leading)
                // user major
                Text(major)
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                    .lineLimit(1)
                // user school
                Text(school)
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.03))
                    .lineLimit(1)
            }.frame(width: UIScreen.main.bounds.width * 0.5)
            // RIGHT - Button
            ZStack {
                Button(action: action) {
                    VStack(spacing: UIScreen.main.bounds.width * 0.01) {
                        // Button icon
                        Image("checkIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.06)
                            .padding(.top, -UIScreen.main.bounds.width * 0.01)
                        // Button text
                        Text("Accept")
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                            .frame(width: UIScreen.main.bounds.width * 0.18)
                            .padding(0)
                    }.frame(height: UIScreen.main.bounds.height * 0.1)
                }
                .buttonStyle(.plain)
                .background(Color(red: 0.8627, green: 0.8313, blue: 0.7960))
                .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                .frame(width: UIScreen.main.bounds.width * 0.18)
                //: Button
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.1)
        .background(Color.white.cornerRadius(UIScreen.main.bounds.width * 0.04))
        .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
        .buttonStyle(.bordered)
        .clipShape(RoundedRectangle(cornerRadius: 16)).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0)
        //: MAIN
    }
}

struct ButtonCardView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCardView(
            action: {},
            image: "",
            name: "",
            major: "",
            school: ""
        )
    }
}
