//
//  MatchedProfileView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

/// profile of the user clicked from matched view
struct MatchedProfileView: View {
    //ref:https://www.cuvenx.com/post/swiftui-pop-to-root-view
    //get presentation mode object - presentation mode object is for poping child view from NavigationView stack
    @Environment(\.presentationMode) var presentation
    /// if pop up showing
    @State private var showPopUp: Bool = false
    /// state to navigate to message view
    @State var isSendMessageActive: Bool = false
    
    @State var user: User
    
    @ObservedObject var LinkUsersVM = LinkUsersViewModel()
    @ObservedObject var userVM = UserViewModel()
    
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
                    // Back Button
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
                        // Profile
                        ProfileView(user: user)
                        // Send message Button
                        VStack{
                            ButtonView_2(action: {
                                LinkUsersVM.messageUser(user: user, matchedUserList: userVM.matchedUsers)
                                // TODO: go to message
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
                    // unmatch
                    LinkUsersVM.unmatchUser(user: user)
                    showPopUp = false
                    presentation.wrappedValue.dismiss()
                },
                buttonText: "Unmatch"
            )
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        //: ZSTACK
    }
}

struct MatchedProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedProfileView(
            user: User(id: "", name: "First name", image: "user_image", major: "test", school: "test", startDate: "Sep 2020", intro: "this is for testing", matchedUsers: [], sentRequests: [], recievedRequests: [], messageUsers: [])
        )
    }
}
