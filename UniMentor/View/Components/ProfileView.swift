//
//  ProfileView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Spacer()
            // MAIN
            // ZStack {
                VStack {
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
                    .padding(.top, -UIScreen.main.bounds.height * 0.11)
                    // Profile Info
                    VStack(spacing: UIScreen.main.bounds.width * 0.06) {
                        // User Name
                        VStack(alignment: .center) {
                            Text("First LastName")
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
                            Text("Computer Systems Technology")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.06))
                            Text("Vancouver Community College")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045))
                            Text("Start Date: September 2020")
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
                            Text("""
I guess we could discuss the implications of the phrase meant to be.

That is if we wanted to drown ourselves in a sea of backwardly referential semantics and other mumbo-jumbo.
I guess we could discuss the implications of the phrase meant to be.

That is if we wanted to drown ourselves in a sea of backwardly referential semantics and other mumbo-jumbo.
I guess we could discuss the implications of the phrase meant to be.

That is if we wanted to drown ourselves in a sea of backwardly referential semantics and other mumbo-jumbo.
I guess we could discuss the implications of the phrase meant to be.

That is if we wanted to drown ourselves in a sea of backwardly referential semantics and other mumbo-jumbo.
I guess we could discuss the implications of the phrase meant to be.

That is if we wanted to drown ourselves in a sea of backwardly referential semantics and other mumbo-jumbo.
I guess we could discuss the implications of the phrase meant to be.

That is if we wanted to drown ourselves in a sea of backwardly referential semantics and other mumbo-jumbo.
I guess we could discuss the implications of the phrase meant to be.

That is if we wanted to drown ourselves in a sea of backwardly referential semantics and other mumbo-jumbo.
""")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045))
                        } //: Introduction
                        .frame(width: UIScreen.main.bounds.width * 0.85, alignment: .leading)
                    } //: Profile Info
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    // Spacer()
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.05)
                } //: VSTACK
                Spacer()
//            } //: ZSTACK
//            .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.8)
//            .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
        } //: VSTACK
        .frame(width: UIScreen.main.bounds.width * 1)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
