//
//  MatchedView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

/// display list of users who are matched with current user
struct MatchedView: View {
    /// if pop up showing
    @State private var showPopUp: Bool = false
    /// if edit button clicked
    @State var isEditClicked: Bool = false
    /// edit button text
    @State var editButtonTitle: String = "Edit"
    
    @ObservedObject var userVM = UserViewModel()
    
    
    @ObservedObject var LinkUsersVM = LinkUsersViewModel()
    
    
    
    /// if match view button clicked
    @Binding var isMatchView: Bool
    /// if message view button clicked
    @Binding var isMessageView: Bool
    /// match view button color
    @Binding var matchedButtonColor: Color
    /// message view button color
    @Binding var messagesButtonColor: Color
    
    
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
                                    if editButtonTitle == "Edit" {
                                        editButtonTitle = "Finish"
                                    } else {
                                        LinkUsersViewModel.selectedUsers = []
                                        editButtonTitle = "Edit"
                                    }
                                    isEditClicked = !isEditClicked
                                }).foregroundColor(.black)
                                
                            }.frame(width: UIScreen.main.bounds.width * 0.9)
                        } //: HEADER
                        .frame(height: UIScreen.main.bounds.height * 0.02)
                        
                        // MAIN
                        VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                            // Card list
                            ScrollView {
                                VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                                    // var isClicked: Bool = false
                                    ForEach(userVM.matchedUsersModel) { user in
                                        if !isEditClicked {
                                            NavigationLink(destination:
                                                MatchedProfileView(user: user,
                                                    isMatchView: $isMatchView,
                                                    isMessageView: $isMessageView,
                                                    matchedButtonColor: $matchedButtonColor,
                                                    messagesButtonColor: $messagesButtonColor))
                                            {
                                                CardView(
                                                    user: user
                                                )
                                            }
                                        } else {
                                            EditCardView(
                                                user: user
                                            )
                                        }
                                    }
                                }
                                .padding(UIScreen.main.bounds.width * 0.02)
                            } //: ScrollView
                        } //: MAIN
                    }
                    if isEditClicked {
                        VStack {
                            // Unmatch button
                            Button(action: {
                                showPopUp = true
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
                }
                .padding(.top, UIScreen.main.bounds.width * 0.02)
                //: BODY
                // POPUP
                PopUpView(
                    show: $showPopUp,
                    information: "Unmatch with selected people?",
                    warnMessage: "* Unmatching will delete messages",
                    buttonAction: {
                        for u in LinkUsersViewModel.selectedUsers {
                            LinkUsersVM.unmatchUser(user: u)
                        }
                        LinkUsersViewModel.selectedUsers = []
                        showPopUp = false
                        editButtonTitle = "Edit"
                        isEditClicked = false
                    },
                    buttonText: "Unmatch"
                )
                //: POPUP
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct MatchedViewPreviewView: View {
    /// if match view button clicked
    @State var isMatchView: Bool = false
    /// if message view button clicked
    @State var isMessageView: Bool = false
    /// match view button color
    @State var matchedButtonColor: Color = Color("DarkColor")
    /// message view button color
    @State var messagesButtonColor: Color = Color("DarkColor")
    @State var matchedUser: User = User(id: "", name: "First name", image: "user_image", major: "test", school: "test", startDate: "Sep 2020", intro: "this is for testing", matchedUsers: [], sentRequests: [], recievedRequests: [], messageUsers: [])
    @State var isMatchedUserMessage: Bool = false
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
