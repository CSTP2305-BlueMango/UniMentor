//
//  HomeCardView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-17.
//

import SwiftUI

/// user card view with dropdown component
struct HomeCardView: View {
    /// card height for dropdown
    @State var cardHeight: Double = 0.1
    /// dropdown button click state
    @State var isButtonClicked: Bool = false
    /// user model
    @State var user: User
    
    var body: some View {
        // MAIN
        VStack(spacing: UIScreen.main.bounds.width * 0.02) {
            HStack(spacing: UIScreen.main.bounds.width * 0.03) {
                // LEFT - Image
                Spacer().frame(width: 0)
                VStack {
                    AsyncImage(url: URL(string: "\(user.image)")) {image in image
                        .resizable()
                        .cornerRadius(50)
                        .aspectRatio(contentMode: .fill)
                    }placeholder: {ProgressView()}
                }
                .frame(width: UIScreen.main.bounds.width * 0.18, height: UIScreen.main.bounds.width * 0.18)
                .clipShape(Circle())
                .shadow(radius: 3)
                // CENTER - Information
                VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.01) {
                    // user name
                    Text(user.name)
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                        .lineLimit(1)
                        .frame(width: UIScreen.main.bounds.width * 0.5, alignment: .leading)
                    // user major
                    Text(user.major)
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                        .lineLimit(1)
                    // user school
                    Text(user.school)
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.03))
                        .lineLimit(1)
                }.frame(width: UIScreen.main.bounds.width * 0.55)
                // RIGHT - Button
                ZStack {
                    // dropdown button
                    Button(action: {
                        if !isButtonClicked {
                            cardHeight = 0.2
                        } else {
                            cardHeight = 0.1
                        }
                        isButtonClicked = !isButtonClicked
                    }) {
                        HStack {
                            if !isButtonClicked {
                                Image(systemName: "chevron.down")
                                    .font(.system(size: UIScreen.main.bounds.width * 0.05))
                                    .background(Color.white)
                            } else {
                                Image(systemName: "chevron.up")
                                    .font(.system(size: UIScreen.main.bounds.width * 0.05))
                                    .background(Color.white)
                            }
                        }
                    }
                    .buttonStyle(.plain)
                    .frame(width: UIScreen.main.bounds.width * 0.13, height: UIScreen.main.bounds.width * 0.13)
                }.frame(width: UIScreen.main.bounds.width * 0.13)
            }.padding(0)
            //: HSTACK
            // user information when dropdown
            if isButtonClicked {
                Divider().padding(0)
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    .background(Color("LightColor"))
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("""
\(user.intro)
""")
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                            .multilineTextAlignment(.leading)
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.87, alignment: .leading)
                }.frame(width: UIScreen.main.bounds.width * 0.87, height: UIScreen.main.bounds.height * 0.08, alignment: .top)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * cardHeight)
        .background(Color.white.cornerRadius(UIScreen.main.bounds.width * 0.04))
        .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
        .buttonStyle(.bordered)
        .clipShape(RoundedRectangle(cornerRadius: 16)).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0)
        //: MAIN
    }
}

struct HomeCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCardView(
            user: User(id: "", name: "", image: "", major: "", school: "", startDate: "", intro: "", matchedUsers: [], sentRequests: [], recievedRequests: [])
        )
    }
}
