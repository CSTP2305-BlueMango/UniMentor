//
//  RequestsProfileView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

struct RequestsProfileView: View {
    var body: some View {
<<<<<<< HEAD
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
                        VStack{
                            ButtonView_2(action: {},
                                 label: "Accept Request",
                                 color: Color("ButtonColor"),
                                 opacity: 1.0,
                                 isBorder: false
                            )
=======
        ZStack {
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
                            VStack{
                                ButtonView_2(action: {
                                    // TODO: accept request
                                    
                                    //pop child view to go back to root view
                                    presentation.wrappedValue.dismiss()
                                },
                                     label: "Accept Request",
                                     color: Color("ButtonColor"),
                                     opacity: 1.0,
                                     isBorder: false
                                )
                            }
                            .padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.05, leading: 0, bottom: UIScreen.main.bounds.height * 0.05, trailing: 0))
>>>>>>> 31d7c90159bd1855a69665e2c60d26d80c45fbb6
                        }
                        .padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.05, leading: 0, bottom: UIScreen.main.bounds.height * 0.05, trailing: 0))
                    }
                    ZStack {
                        Button(action: {
                            // print("this is test")
                        }) {
                            Image(systemName: "xmark.circle")
                                .foregroundColor(
                                    Color("UnmatchColor"))
                                .font(.system(size: UIScreen.main.bounds.width * 0.07))
                        }
                    }.padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.12, leading: UIScreen.main.bounds.width * 0.88, bottom: 0, trailing: 0))
                }.frame(minHeight: UIScreen.main.bounds.height * 0.5)
            }
        }
        .frame(height: UIScreen.main.bounds.height * 0.9)
    }
}

struct RequestsProfileView_Previews: PreviewProvider {
    static var previews: some View {
        RequestsProfileView()
    }
}
