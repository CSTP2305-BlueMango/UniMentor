//
//  ProfileView_2.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-17.
//

import SwiftUI

/// user profile component
struct ProfileView: View {
    
    /// user
    @State var user: User
    
    var body: some View {
        // MAIN
        VStack(spacing: UIScreen.main.bounds.height * 0.02) {
            // Profile Image
            VStack {
                Image(user.image)
                    .resizable()
                    .cornerRadius(50)
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.45)
            .clipShape(Circle())
            .shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0)
            //: Profile Image
            // Profile Info
            VStack(spacing: UIScreen.main.bounds.width * 0.06) {
                // User Name
                VStack(alignment: .center) {
                    Text(user.name)
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.09))
                }
                // Divider
                VStack(spacing: 0) {
                    Divider()
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        .background(Color("LightColor"))
                    VStack(alignment: .leading) {
                        VStack(alignment: .center) {
                            Text("Education")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.035)
                        .background(Color("LightColor"))
                    }.frame(width: UIScreen.main.bounds.width * 0.85, alignment: .leading)
                } //: Divider
                // Education Info
                VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.04) {
                    Text(user.major)
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.06))
                    Text(user.school)
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045))
                    Text("Start Date: \(user.startDate)")
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                } //: Education Info
                .frame(width: UIScreen.main.bounds.width * 0.85, alignment: .leading)
                // Divider
                VStack(spacing: 0) {
                    Divider()
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        .background(Color("LightColor"))
                    VStack(alignment: .leading) {
                        VStack(alignment: .center) {
                            Text("Introduction")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.height * 0.035)
                        .background(Color("LightColor"))
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.85, alignment: .leading)
                } //: Divider
                // Introduction
                VStack(alignment: .leading) {
                    Text(
"""
\(user.intro)
""")
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045))
                } //: Introduction
                .frame(width: UIScreen.main.bounds.width * 0.85, alignment: .leading)
            } //: Profile Info
            .frame(minHeight: UIScreen.main.bounds.height * 0.3)
            
        } //: MAIN
        .frame(minHeight: UIScreen.main.bounds.height * 0.5)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(
            user: User(id: "", name: "", image: "", major: "", school: "", startDate: "", intro: "", matchedUsers: [], sentRequests: [], recievedRequests: [], messageUsers: [])
        )
    }
}
