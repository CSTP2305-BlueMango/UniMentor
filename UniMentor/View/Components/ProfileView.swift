//
//  ProfileView_2.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-17.
//

import SwiftUI

struct ProfileView: View {
    @State var name: String
    @State var major: String
    @State var school: String
    @State var startDate: String
    @State var introduction: String
    
    var body: some View {
        // MAIN
        VStack(spacing: UIScreen.main.bounds.height * 0.02) {
            // Profile Image
            VStack {
                Image("user")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .shadow(radius: 3)
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                    .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.45)
            } //: Profile Image
            // Profile Info
            VStack(spacing: UIScreen.main.bounds.width * 0.06) {
                // User Name
                VStack(alignment: .center) {
                    Text("\(name)")
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
                    Text("\(major)")
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.06))
                    Text("\(school)")
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045))
                    Text("Start Date: \(startDate)")
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
\(introduction)
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
            name: "First Lastname",
            major: "Computer Systems Technology",
            school: "Vancouver Community College",
            startDate: "September 2020",
            introduction: """
I guess we could discuss the implications of the phrase meant to be.

That is if we wanted to drown ourselves in a sea of backwardly referential semantics and other mumbo-jumbo.
"""
        )
    }
}
