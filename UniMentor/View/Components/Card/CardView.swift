//
//  CardView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI
import CachedAsyncImage

/// user card view component
/// param: User
struct CardView: View {
    /// user model
    @State var user: User
    
    var body: some View {
        // CARD
        HStack(spacing: UIScreen.main.bounds.width * 0.03) {
            // LEFT - Image
            Spacer().frame(width: 0)
            VStack {
                AsyncImage(url: URL(string: "\(user.image)")) {image in image
                    .resizable()
                    .cornerRadius(50)
                    .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
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
                    .frame(width: UIScreen.main.bounds.width * 0.65, alignment: .leading)
                // user major
                Text(user.major)
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                    .lineLimit(1)
                // user school
                Text(user.school)
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.03))
                    .lineLimit(1)
            }.frame(width: UIScreen.main.bounds.width * 0.65)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.1)
        .background(Color.white.cornerRadius(UIScreen.main.bounds.width * 0.04))
        .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
        .buttonStyle(.bordered)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0)
        //: CARD
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            user: User(id: "", name: "", image: "", major: "", school: "", startDate: "", intro: "", matchedUsers: [], sentRequests: [], recievedRequests: [])
        )
    }
}
