//
//  MatchedProfileView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

/// profile of the user clicked from matched view
struct MatchedProfileView: View {
    /// if pop up showing
    @State private var showPopUp: Bool = false
    /// state to navigate to message view
    @State var isSendMessageActive: Bool = false
    
    var body: some View {
        ZStack {
            //NAVIGATION LINK
            NavigationLink(
                destination: MessageChatView(),
                isActive: $isSendMessageActive
            ) {EmptyView()}
            //:NAVIGATION LINK
            
            ScrollView {
                // MAIN
                ZStack(alignment: .top) {
                    // Background
                    ZStack {}
                    .frame(minWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
                    .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                    .padding(.top, UIScreen.main.bounds.height * 0.11)
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
                        // Send message Button
                        VStack{
                            ButtonView_2(action: {
                                isSendMessageActive = true
                            },
                                 label: "Send Message",
                                 color: Color("ButtonColor"),
                                 opacity: 1.0,
                                 isBorder: false
                            )
                        }
                        .padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.05, leading: 0, bottom: UIScreen.main.bounds.height * 0.05, trailing: 0))
                    }
                    // Unmatch Button
                    ZStack {
                        Button(action: {
                            showPopUp = true
                        }) {
                            Image(systemName: "xmark.circle")
                                .foregroundColor(
                                    Color("UnmatchColor"))
                                .font(.system(size: UIScreen.main.bounds.width * 0.07))
                        }
                    }.padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.12, leading: UIScreen.main.bounds.width * 0.88, bottom: 0, trailing: 0))
                    //: Unmatch Button
                }.frame(minHeight: UIScreen.main.bounds.height * 0.5)
                //: MAIN
            }//: ScrollView
            // POPUP
            PopUpView(
                show: $showPopUp,
                information: "Unmatch with First Lastname?",
                warnMessage: "* Unmatching will delete messages",
                buttonAction: {
                    // TODO: unmatch
                },
                buttonText: "Unmatch"
            )
        }
        .frame(height: UIScreen.main.bounds.height * 0.9)
        //: ZSTACK
    }
}

struct MatchedProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedProfileView()
    }
}
