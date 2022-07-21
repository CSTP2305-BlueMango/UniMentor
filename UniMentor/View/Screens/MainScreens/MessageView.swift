//
//  ChatView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

/// display list of users who current user got message from
struct MessageView: View {
    /// if popup showing
    @State private var showPopUp: Bool = false
    /// if edit button clicked
    @State var isEditClicked: Bool = false
    /// edit button text
    @State var editButtonTitle: String = "Edit"
    
    @ObservedObject var vm = AllUsersViewModel()
    @ObservedObject var userVM = UserViewModel()
    @ObservedObject var messageUserVM = MessageUserViewModel()
    
    
    @ObservedObject var LinkUsersVM = LinkUsersViewModel()
    
    var body: some View {
        ZStack {
            // BODY
            VStack(spacing: 0) {
                VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                    // HEADER
                    VStack {
                        Spacer()
                        HStack {
                            // TITLE
                            Text("Messages")
                                .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.12))
                            Spacer()
                            // Edit button
                            EditButtonView(title: editButtonTitle, action: {
                                if editButtonTitle == "Edit" {
                                    editButtonTitle = "Finish"
                                } else {
                                    editButtonTitle = "Edit"
                                }
                                isEditClicked = !isEditClicked
                            }).foregroundColor(.black)
                        }.frame(width: UIScreen.main.bounds.width * 0.9)
                    } //: HEADER
                    .frame(height: UIScreen.main.bounds.height * 0.02)
                    // MAIN
                    VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                        ScrollView {
                            
                            Text(vm.errorMessage)
                            
                            VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                                ForEach(messageUserVM.messageUsers.reversed()) { user in
                                    if !isEditClicked {
                                        NavigationLink(destination: MessageChatView(user: user)) {
                                            MessageCardView(
                                                user: user
                                            )
                                        }
                                    } else {
                                        EditMessageCardView(
                                            user: user
                                        )
                                    }
                                }
                            }
                            .padding(UIScreen.main.bounds.width * 0.02)
                            .padding(.horizontal)
                        } //: Scrollview
                    } //: MAIN
                }
                if isEditClicked {
                    VStack {
                        // Unmatch button
                        Button(action: {
                            showPopUp = true
                        }) {
                            Text("Delete")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                        }
                        .frame(width: UIScreen.main.bounds.width * 1)
                        .padding(UIScreen.main.bounds.width * 0.04)
                        .foregroundColor(.black)
                        .background(Color("ButtonColor"))
                    }.padding(0)
                }
            }
            
            .padding(.top, UIScreen.main.bounds.width * 0.02)
            .navigationBar(backButton: true, barHidden: true)
            //: BODY
            // POPUP
            PopUpView(
                show: $showPopUp,
                information: "Delete messages with selected people?",
                buttonAction: {
                    // delete messages
                    for u in LinkUsersViewModel.selectedMessageUsers {
                        LinkUsersVM.deleteMessages(user: u)
                    }
                    LinkUsersViewModel.selectedUsers = []
                    showPopUp = false
                    editButtonTitle = "Edit"
                    isEditClicked = false
                },
                buttonText: "Delete"
            )
            //: POPUP
        }
//        .onAppear() {
//            messageUserVM.fetchMessageUsers()
//        }
    }
}

struct MessageViewPreviewView: View {
    @State var isMatchedUserMessage: Bool = false
    var body: some View {
        MessageView(
        )
    }
    
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageViewPreviewView()
    }
}
