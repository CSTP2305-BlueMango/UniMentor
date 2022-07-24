//
//  MatchedView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

/// display list of users who are matched with current user
/// param: isMatchView, isMessageView, matchedButtonColor, messagesButtonColor
struct MatchedView: View {
    /// unmatch pop up show state
    @State private var showUnmatchPopUp: Bool = false
    /// edit button clicked state
    @State var isEditClicked: Bool = false
    /// edit button text
    @State var editButtonTitle: String = "Edit"
    /// match view button clicked state
    @Binding var isMatchView: Bool
    /// message view button clicked state
    @Binding var isMessageView: Bool
    /// match view button color
    @Binding var matchedButtonColor: Color
    /// message view button color
    @Binding var messagesButtonColor: Color
    
    /// user view model object
    @ObservedObject var userVM = UserViewModel()
    /// link users view model object
    @ObservedObject var LinkUsersVM = LinkUsersViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                // BODY
                VStack(spacing: 0) {
                    VStack(spacing: UIScreen.main.bounds.height * 0.04)  {
                        // HEADER
                        VStack {
                            Spacer()
                            HStack {
                                // TITLE
                                Text("Matched")
                                    .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.12))
                                Spacer()
                                // Edit button
                                EditButtonView(title: editButtonTitle, action: {
                                    // change edit button title
                                    if editButtonTitle == "Edit" {
                                        editButtonTitle = "Finish"
                                    } else {
                                        // reset selected users list
                                        LinkUsersViewModel.selectedUsers = []
                                        editButtonTitle = "Edit"
                                    }
                                    // change edit clicked state
                                    isEditClicked = !isEditClicked
                                }).foregroundColor(.black)
                            }.frame(width: UIScreen.main.bounds.width * 0.9)
                            //: HSTACK
                        }.frame(height: UIScreen.main.bounds.height * 0.02)
                        //: HEADER
                        // MAIN
                        VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                            // Card list
                            ScrollView {
                                VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                                    // loop through matched user models
                                    ForEach(userVM.matchedUsersModel) { user in
                                        // edit state is false
                                        if !isEditClicked {
                                            // User card - navigate to MatchedProfileView
                                            NavigationLink(destination:
                                                MatchedProfileView(user: user,
                                                    isMatchView: $isMatchView,
                                                    isMessageView: $isMessageView,
                                                    matchedButtonColor: $matchedButtonColor,
                                                    messagesButtonColor: $messagesButtonColor))
                                            {
                                                CardView(user: user)
                                            }
                                        }
                                        // edit state is true
                                        else {
                                            // Edit user card
                                            EditCardView(user: user)
                                        }
                                    }
                                }.padding(UIScreen.main.bounds.width * 0.02)
                            } //: ScrollView
                        } //: MAIN
                    }
                    // Unmatch button when edit state is true
                    if isEditClicked {
                        VStack {
                            // Unmatch button
                            Button(action: {
                                // show unmatch popup
                                showUnmatchPopUp = true
                            }) {
                                Text("Unmatch")
                                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                                    .frame(width: UIScreen.main.bounds.width * 1)
                                    .padding(UIScreen.main.bounds.width * 0.04)
                                    .foregroundColor(.black)
                                    .background(Color("ButtonColor"))
                            }
                        }.padding(0)
                    }
                }.padding(.top, UIScreen.main.bounds.width * 0.02)
                //: BODY
                // POPUP - unmatch users popup
                PopUpView(
                    show: $showUnmatchPopUp,
                    information: "Unmatch with selected people?",
                    warnMessage: "* Unmatching will delete messages",
                    buttonAction: {
                        // loop through selected matched users
                        for selectedUser in LinkUsersViewModel.selectedUsers {
                            // unmatch with selected user
                            LinkUsersVM.unmatchUser(user: selectedUser)
                        }
                        // reset selected users list
                        LinkUsersViewModel.selectedUsers = []
                        // discard popup
                        showUnmatchPopUp = false
                        // change edit button title
                        editButtonTitle = "Edit"
                        // change edit state to false
                        isEditClicked = false
                    },
                    buttonText: "Unmatch"
                )//: POPUP
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            //: ZSTACK
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        //: NAVIGATIONVIEW
    }
}

struct MatchedViewPreviewView: View {
    @State var isMatchView: Bool = false
    @State var isMessageView: Bool = false
    @State var matchedButtonColor: Color = Color("DarkColor")
    @State var messagesButtonColor: Color = Color("DarkColor")
    var body: some View {
        MatchedView(
            isMatchView: $isMatchView,
            isMessageView: $isMessageView,
            matchedButtonColor: $matchedButtonColor,
            messagesButtonColor: $messagesButtonColor
        )
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedViewPreviewView()
    }
}
