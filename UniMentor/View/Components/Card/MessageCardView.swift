//
//  MessageCardView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-17.
//

import SwiftUI

/// user card view with latest message component
/// param: MessageUser
struct MessageCardView: View {
    /// message user model
    @State var user: MessageUser
    
    var body: some View {
        // CARD
        HStack(spacing: UIScreen.main.bounds.width * 0.03) {
            // LEFT - Image
            Spacer().frame(width: 0)
            VStack {
                AsyncImage(url: URL(string: "\(user.userImage)")) {image in image
                    .resizable()
                    .cornerRadius(50)
                    .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Image("")
                         .resizable()
                         .cornerRadius(50)
                         .background(Color(red: 0.9490, green: 0.9490, blue: 0.9490))
                         .aspectRatio(contentMode: .fill)
                         .clipShape(Circle())
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.18, height: UIScreen.main.bounds.width * 0.18)
            .clipShape(Circle())
            .shadow(radius: 3)
            // CENTER - Information
            VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.01) {
                HStack {
                    // User name
                    Text(user.userName)
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                        .lineLimit(1)
                        .frame(width: UIScreen.main.bounds.width * 0.45, alignment: .leading)
                    Spacer()
                    // Time of lastest message
                    Text(formatTimeStemp(timestemp: user.timestamp))
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                }.frame(width: UIScreen.main.bounds.width * 0.65, alignment: .leading)
                // Latest message
                Text(user.text)
                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                    .foregroundColor(Color.gray)
                    .lineLimit(2)
                    .frame(height: UIScreen.main.bounds.height * 0.035, alignment: .top)
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
}

struct MessageCardView_Previews: PreviewProvider {
    static var previews: some View {
        MessageCardView(
            user: MessageUser(data: ["id": "", "userName": "", "userImage": "", "fromId": "", "text": "", "timestamp": ""])
        )
    }
}

/// format timestemp to get only time
/// param: timestemp of user message
func formatTimeStemp(timestemp: String) -> String {
    // if timestemp is not empty
    if timestemp != "" {
        let result = timestemp.components(separatedBy: " ")
        // return time
        return "\(result[4]) \(result[5])"
    }
    // if timestemp is empty return empty string
    else {
        return ""
    }
}
