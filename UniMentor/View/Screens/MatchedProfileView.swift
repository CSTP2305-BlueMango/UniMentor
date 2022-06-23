//
//  MatchedProfileView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

struct MatchedProfileView: View {
    @State private var showPopUp: Bool = false
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
                ZStack(alignment: .top) {
                    // Background
                    ZStack {}
                    .frame(minWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
                    .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                    .padding(.top, UIScreen.main.bounds.height * 0.11)
                    VStack {
                        ProfileView()
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
                }.frame(minHeight: UIScreen.main.bounds.height * 0.5)
            }
            PopUpView(show: $showPopUp, information: "Unmatch with First Lastname?",
                      warmMessage: "* Unmatching will delete messages", buttonAction: {
                // TODO: unmatch
            },
                      buttonText: "Unmatch")
        }
        .frame(height: UIScreen.main.bounds.height * 0.9)
    }
}

struct MatchedProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedProfileView()
    }
}
