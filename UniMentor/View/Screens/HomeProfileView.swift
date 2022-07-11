//
//  HomeProfileView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

/// profile of the user clicked from home view
struct HomeProfileView: View {
    //ref:https://www.cuvenx.com/post/swiftui-pop-to-root-view
    //get presentation mode object - presentation mode object is for poping child view from NavigationView stack
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack(alignment: .top) {
            // BODY
            VStack {
                ScrollView {
                    ZStack(alignment: .top) {
                        // Background
                        ZStack {}
                        .frame(minWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
                        .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                        .padding(.top, UIScreen.main.bounds.height * 0.11)
                        // BackButton
                        HStack {
                            Button(action: {
                                presentation.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(.black)
                                    .font(.system(size: UIScreen.main.bounds.width * 0.06))
                            }
                            Spacer()
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        .padding(.top, UIScreen.main.bounds.height * 0.01)
                        VStack {
                            // profile
                            // TODO: actual info
                            ProfileView(
                                image: "user_image",
                                name: "First Lastname",
                                major: "Computer Systems Technology",
                                school: "Vancouver Community College",
                                startDate: "September 2020",
                                information: """
                    I guess we could discuss the implications of the phrase meant to be.

                    That is if we wanted to drown ourselves in a sea of backwardly referential semantics and other mumbo-jumbo.
                    """)
                            // request button
                            VStack{
                                ButtonView_2(action: {
                                    // TODO: send match request
                                    
                                    //pop child view to go back to root view
                                    presentation.wrappedValue.dismiss()
                                },
                                     label: "Request for match",
                                     color: Color("ButtonColor"),
                                     opacity: 1.0,
                                     isBorder: false
                                )
                            }
                            .padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.05, leading: 0, bottom: UIScreen.main.bounds.height * 0.05, trailing: 0))
                        }
                    }.frame(minHeight: UIScreen.main.bounds.height * 0.5)
                } //: ScrollView
            }
            //: BODY
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeProfileView_Previews: PreviewProvider {
    static var previews: some View {
        HomeProfileView()
    }
}
