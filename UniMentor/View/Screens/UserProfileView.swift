//
//  UserProfile.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

struct UserProfile: View {
    var body: some View {
<<<<<<< HEAD
        NavigationView {
            // BODY
            VStack {
                ScrollView {
                    ZStack(alignment: .top) {
                        // Background
                        ZStack {}
                        .frame(minWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
                        .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                        .padding(.top, UIScreen.main.bounds.height * 0.11)
                        VStack {
                            ProfileView()
                                .padding(.bottom, UIScreen.main.bounds.height * 0.05)
                        }
                        ZStack {
                            Button(action: {
                                // print("this is test")
                            }) {
                                Image(systemName: "square.and.pencil")
                                    .font(.system(size: UIScreen.main.bounds.width * 0.07))
                                    .foregroundColor(Color.black)
                            }
                        }.padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.12, leading: UIScreen.main.bounds.width * 0.88, bottom: 0, trailing: 0))
                        ZStack {
                            Button(action: {
                                // print("this is test")
                            }) {
                                Image(systemName: "exclamationmark.square")
                                    .font(.system(size: UIScreen.main.bounds.width * 0.07))
                                    .foregroundColor(Color.black)
=======
        ZStack {
            NavigationView {
                // BODY
                VStack {
                    ScrollView {
                        ZStack(alignment: .top) {
                            // Background
                            ZStack {}
                            .frame(minWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
                            .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                            .padding(.top, UIScreen.main.bounds.height * 0.11)
                            VStack {
                                ProfileView(
                                    name: "First Lastname",
                                    major: "Computer Systems Technology",
                                    school: "Vancouver Community College",
                                    startDate: "September 2020",
                                    introduction: """
                        I guess we could discuss the implications of the phrase meant to be.

                        That is if we wanted to drown ourselves in a sea of backwardly referential semantics and other mumbo-jumbo.
                        """)
                                    .padding(.bottom, UIScreen.main.bounds.height * 0.05)
>>>>>>> 31d7c90159bd1855a69665e2c60d26d80c45fbb6
                            }
                        }.padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.12, leading: -UIScreen.main.bounds.width * 0.48, bottom: 0, trailing: 0))
                    }.frame(minHeight: UIScreen.main.bounds.height * 0.5)
                    // FOOTER
                    VStack(spacing: UIScreen.main.bounds.height * 0.01) {
                        Text("Matched students")
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                        Text("\(10)")
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                    } //: FOOTER
                    .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.1)
                        .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                }
            } //: BODY
            .padding(.top, UIScreen.main.bounds.width * 0.02)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        } //: NAV_VIEW
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
