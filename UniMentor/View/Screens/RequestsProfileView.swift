//
//  RequestsProfileView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

/// profile of the user clicked from request view
struct RequestsProfileView: View {
    //ref:https://www.cuvenx.com/post/swiftui-pop-to-root-view
    //get presentation mode object - presentation mode object is for poping child view from NavigationView stack
    @Environment(\.presentationMode) var presentation
    /// if pop up showing
    @State private var showDeclinePopUp: Bool = false
    /// if matched pop up showing
    @State private var showMatchPopup: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    ZStack(alignment: .top) {
                        // Background
                        ZStack {}
                        .frame(minWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
                        .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                        .padding(.top, UIScreen.main.bounds.height * 0.11)
                        // MAIN
                        VStack {
                            // Profile
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
                            // Accept Button
                            VStack {
                                ButtonView_2(action: {
                                    // TODO: accept request
                                    
                                    
                                    showMatchPopup = true
                                },
                                     label: "Accept Request",
                                     color: Color("ButtonColor"),
                                     opacity: 1.0,
                                     isBorder: false
                                )
                            }
                            .padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.05, leading: 0, bottom: UIScreen.main.bounds.height * 0.05, trailing: 0))
                            //: Accept Button
                        } //: MAIN
                        // Decline button
                        ZStack {
                            Button(action: {
                                showDeclinePopUp = true
                            }) {
                                Image(systemName: "xmark.circle")
                                    .foregroundColor(
                                        Color("UnmatchColor"))
                                    .font(.system(size: UIScreen.main.bounds.width * 0.07))
                            }
                        }.padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.12, leading: UIScreen.main.bounds.width * 0.88, bottom: 0, trailing: 0))
                        //: Decline button
                    }.frame(minHeight: UIScreen.main.bounds.height * 0.5)
                }
            }
            .frame(height: UIScreen.main.bounds.height * 0.9)
            //: VSTACK
            // POPUP
            // matched popup
            MatchedPopupView(
                show: $showMatchPopup,
                matchedUserName: "First Lastname",
                matchedUserImage: "user_image",
                action: {
                    showMatchPopup = false
                    presentation.wrappedValue.dismiss()
                }
            )
            // decline popup
            PopUpView(
                show: $showDeclinePopUp,
                information: "Decline request from First Lastname?",
                buttonAction: {
                    // TODO: decline request
                },
                buttonText: "Decline"
            )
            //: POPUP
            
        }//: ZSTACK
    }
}

struct RequestsProfileView_Previews: PreviewProvider {
    static var previews: some View {
        RequestsProfileView()
    }
}
