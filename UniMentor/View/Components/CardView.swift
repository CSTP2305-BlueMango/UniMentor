//
//  CardView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

/// user card view component
struct CardView: View {
    // TODO: get student object or student info
    /// edit active state
    var isEditClicked: Bool = false
    /// card selected state
    @State var isOn1: Bool = false
    
    /// user id
    @State var userID: String
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
        HStack {
            // edit active
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
                                Image(image)
                                    .resizable()
                                    .cornerRadius(50)
                                    .aspectRatio(contentMode: .fill)
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
                                    .frame(width: UIScreen.main.bounds.width * 0.65, alignment: .leading)
                                // user major
                                Text(major)
                                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                                    .lineLimit(1)
                                // user school
                                Text(school)
                                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.03))
                                    .lineLimit(1)
                            }.frame(width: UIScreen.main.bounds.width * 0.65)
                            Spacer()
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.1)
                        .background(Color.white.cornerRadius(UIScreen.main.bounds.width * 0.04))
                        .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                        .buttonStyle(.bordered)
                        .clipShape(RoundedRectangle(cornerRadius: 16)).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0)
                        //: CARD
                    }
                    .frame(width: UIScreen.main.bounds.width * 1).padding(.leading, UIScreen.main.bounds.width * 0.12)
                    //: HSTACK
                }//: Button
            }
            // edit not active
            else {
                // CARD
                HStack(spacing: UIScreen.main.bounds.width * 0.03) {
                    // LEFT - Image
                    Spacer().frame(width: 0)
                    VStack {
                        Image(image)
                            .resizable()
                            .cornerRadius(50)
                            .aspectRatio(contentMode: .fill)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.18, height: UIScreen.main.bounds.width * 0.18)
                    .clipShape(Circle())
                    .shadow(radius: 3)
                    // CENTER - Information
                    VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.01) {
                        Text(name)
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                            .lineLimit(1)
                            .frame(width: UIScreen.main.bounds.width * 0.65, alignment: .leading)
                        Text(major)
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                            .lineLimit(1)
                        Text(school)
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.03))
                            .lineLimit(1)
                    }.frame(width: UIScreen.main.bounds.width * 0.65)
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.1)
                .background(Color.white.cornerRadius(UIScreen.main.bounds.width * 0.04))
                .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                .buttonStyle(.bordered)
                .clipShape(RoundedRectangle(cornerRadius: 16)).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0)
                //: CARD
            }
        } //: MAIN
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            isEditClicked: false,
            userID: "1",
            image: "user_image",
            name: "First Lastname",
            major: "Computer Systems Technology",
            school: "Vancouver Community College"
        )
    }
}
