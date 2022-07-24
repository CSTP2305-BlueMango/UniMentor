//
//  MatchedProfileView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

/// profile of the user clicked from matched view
/// param: user, isMatchView, isMessageView, matchedButtonColor, messagesButtonColor
struct MatchedProfileView: View {
    /// user model
    @State var user: User
    /// if match view button clicked
    @Binding var isMatchView: Bool
    /// if message view button clicked
    @Binding var isMessageView: Bool
    /// match view button color
    @Binding var matchedButtonColor: Color
    /// message view button color
    @Binding var messagesButtonColor: Color
    /// unmatch pop up show state
    @State private var showUnmatchPopUp: Bool = false
    
    /// user view model object
    @ObservedObject var userVM = UserViewModel()
    /// link user view model object
    @ObservedObject var LinkUsersVM = LinkUsersViewModel()
    
    /// view presentation mode
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
            ScrollView {
                ZStack(alignment: .top) {
                    // Background
                    ZStack {}
                    .frame(minWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
                    .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                    .padding(.top, UIScreen.main.bounds.height * 0.11)
                    // Back Button
                    BackButtonView(action: {
                        // pop child view to go back to matched view
                        presentation.wrappedValue.dismiss()
                    }).padding(.top, UIScreen.main.bounds.height * 0.01)
                    // MAIN
                    VStack {
                        // Profile
                        ProfileView(user: $user)
                        // Send message Button
                        VStack{
                            ButtonView(action: {
                                // go to message view - change TabBarView variable state and color
                                isMatchView = false
                                isMessageView = true
                                matchedButtonColor = Color("DarkColor")
                                messagesButtonColor = .white
                                // add user to messageUser
                                userVM.saveMessageUser(messageuser: user)
                            },
                                 label: "Send Message",
                                 color: Color("ButtonColor")
                            )
                        }.padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.05, leading: 0, bottom: UIScreen.main.bounds.height * 0.05, trailing: 0))
                    }
                    //: MAIN
                    // Unmatch Button
                    ZStack {
                        Button(action: {
                            // show unmatch popup
                            showUnmatchPopUp = true
                        }) {
                            Image(systemName: "xmark.circle")
                                .foregroundColor(Color("UnmatchColor"))
                                .font(.system(size: UIScreen.main.bounds.width * 0.07))
                        }
                    }.padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.12, leading: UIScreen.main.bounds.width * 0.88, bottom: 0, trailing: 0))
                    //: Unmatch Button
                }.frame(minHeight: UIScreen.main.bounds.height * 0.5)
            }//: ScrollView
            // POPUP
            // unmatch popup
            PopUpView(
                show: $showUnmatchPopUp,
                information: "Unmatch with \(user.name)?",
                warnMessage: "* Unmatching will delete messages",
                buttonAction: {
                    // unmatch user
                    LinkUsersVM.unmatchUser(user: user)
                    // discard unmatch popup
                    showUnmatchPopUp = false
                    // pop child view to go back to matched view
                    presentation.wrappedValue.dismiss()
                },
                buttonText: "Unmatch"
            ) //: POPUP
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        //: ZSTACK
    }
}

struct MatchedProfileViewPreviewView: View {
    /// if match view button clicked
    @State var isMatchView: Bool = false
    /// if message view button clicked
    @State var isMessageView: Bool = false
    /// match view button color
    @State var matchedButtonColor: Color = Color("DarkColor")
    /// message view button color
    @State var messagesButtonColor: Color = Color("DarkColor")
    var body: some View {
        MatchedProfileView(
            user: User(id: "", name: "", image: "", major: "", school: "", startDate: "", intro: "", matchedUsers: [], sentRequests: [], recievedRequests: []),
            isMatchView: $isMatchView,
            isMessageView: $isMessageView,
            matchedButtonColor: $matchedButtonColor,
            messagesButtonColor: $messagesButtonColor
        )
    }
    
}

struct MatchedProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedProfileViewPreviewView()
    }
}
