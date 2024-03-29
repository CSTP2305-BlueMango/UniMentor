//
//  ChatView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

/// display list of users who current user got message from
struct MessageView: View {
    /// delete message popup show state
    @State private var showDeletePopUp: Bool = false
    /// if edit button clicked
    @State var isEditClicked: Bool = false
    /// show unmatch button  state
    @State var isShowDeleteButton: Bool = false
    /// edit button text
    @State var editButtonTitle: String = "Edit"
    
    /// message user view model object
    @ObservedObject var messageUserVM = MessageUserViewModel()
    /// link user view model object
    @ObservedObject var LinkUsersVM = LinkUsersViewModel()
    
    /// network error
    @State var isErrorOccured: Bool = false;
    
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
                                // change edit button title
                                if editButtonTitle == "Edit" {
                                    editButtonTitle = "Finish"
                                } else {
                                    // reset selected message users list
                                    LinkUsersViewModel.selectedMessageUsers = []
                                    editButtonTitle = "Edit"
                                }
                                // change edit clicked state
                                isEditClicked.toggle()
                                // show unmatch button
                                withAnimation(.easeInOut) {
                                    isShowDeleteButton.toggle()
                                }
                            }).foregroundColor(.black)
                        }.frame(width: UIScreen.main.bounds.width * 0.9)
                        //: HSTACK
                    }.frame(height: UIScreen.main.bounds.height * 0.02)
                    //: HEADER
                    // MAIN
                    VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                        ScrollView {
                            VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                                // loop through message users list
                                ForEach(messageUserVM.messageUsers.reversed()) { user in
                                    // edit state is false
                                    if !isEditClicked {
                                        // User card - navigate to MessageChatView
                                        NavigationLink(destination: MessageChatView(user: user)) {
                                            // CARD
                                            HStack(spacing: UIScreen.main.bounds.width * 0.03) {
                                                // LEFT - Image
                                                Spacer().frame(width: 0)
                                                VStack {
                                                    AsyncImage(url: URL(string: "\(user.userImage)")) {image in image
                                                        .resizable()
                                                        .cornerRadius(50)
                                                        .aspectRatio(contentMode: .fill)
                                                    } placeholder: {
                                                        Image("")
                                                             .resizable()
                                                             .cornerRadius(50)
                                                             .background(Color(red: 0.9490, green: 0.9490, blue: 0.9490))
                                                             .aspectRatio(contentMode: .fill)
                                                             .clipShape(Circle())
                                                    }
                                                }
                                                .frame(width: UIScreen.main.bounds.width * 0.18, height: UIScreen.main.bounds.width * 0.18)
                                                .clipShape(Circle())
                                                .shadow(radius: 3)
                                                // CENTER - Information
                                                VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.01) {
                                                    HStack {
                                                        // User name
                                                        Text(user.userName)
                                                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                                                            .lineLimit(1)
                                                            .frame(width: UIScreen.main.bounds.width * 0.45, alignment: .leading)
                                                        Spacer()
                                                        // Time of lastest message
                                                        Text(formatTimeStemp(timestemp: user.timestamp))
                                                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                                                    }.frame(width: UIScreen.main.bounds.width * 0.65, alignment: .leading)
                                                    // Latest message
                                                    Text(user.text)
                                                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                                                        .foregroundColor(Color.gray)
                                                        .lineLimit(2)
                                                        .frame(height: UIScreen.main.bounds.height * 0.035, alignment: .top)
                                                }.frame(width: UIScreen.main.bounds.width * 0.65)
                                                Spacer()
                                            }
                                            .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.1)
                                            .background(Color.white.cornerRadius(UIScreen.main.bounds.width * 0.04))
                                            .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                                            .buttonStyle(.bordered)
                                            .clipShape(RoundedRectangle(cornerRadius: 16)).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0)
                                            //: CARD
                                        }
                                    }
                                    // edit state is true
                                    else {
                                        // Edit user card
                                        EditMessageCardView(user: user)
                                    }
                                }
                            }
                            .padding(UIScreen.main.bounds.width * 0.02)
                            .padding(.horizontal)
                        } //: Scrollview
                    } //: MAIN
                }
                // Delete button when edit state is true
                if isShowDeleteButton {
                    VStack {
                        // Delete button
                        Button(action: {
                            // show delete popup
                            showDeletePopUp = true
                        }) {
                            Text("Delete")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                        }
                        .frame(width: UIScreen.main.bounds.width * 1)
                        .padding(UIScreen.main.bounds.width * 0.04)
                        .foregroundColor(.black)
                        .background(Color("ButtonColor"))
                    }
                    .padding(0)
                    .transition(.move(edge: .bottom))
                }
            }
            .padding(.top, UIScreen.main.bounds.width * 0.02)
            .navigationBar(backButton: true, barHidden: true)
            //: BODY
            // POPUP - delete message users popup
            PopUpView(
                show: $showDeletePopUp,
                information: "Delete messages with selected people?",
                buttonAction: {
                    // loop through selected message users
                    for u in LinkUsersViewModel.selectedMessageUsers {
                        // delete messages of selected message user
                        LinkUsersVM.deleteMessages(user: u)
                    }
                    // reset selected message users list
                    LinkUsersViewModel.selectedMessageUsers = []
                    // discard popup
                    showDeletePopUp = false
                    // discard button
                    isShowDeleteButton = false
                    // change edit button title
                    editButtonTitle = "Edit"
                    // change edit state to false
                    isEditClicked = false
                },
                buttonText: "Delete"
            )//: POPUP
            ErrorPopupView(
                show: $isErrorOccured,
                errorMessage: Binding(get: {
                    "\(messageUserVM.errorMessage)\n\(LinkUsersVM.errorMessage)"
                }, set: {_ in})
            ) {
                messageUserVM.errorMessage = "";
                LinkUsersVM.errorMessage = "";
            }
        }.onReceive(messageUserVM.$errorMessage) { _ in
            isErrorOccured = !messageUserVM.errorMessage.isEmpty;
        }
        .onReceive(LinkUsersVM.$errorMessage) { _ in
            isErrorOccured = !LinkUsersVM.errorMessage.isEmpty
        }//: ZSTACK
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
