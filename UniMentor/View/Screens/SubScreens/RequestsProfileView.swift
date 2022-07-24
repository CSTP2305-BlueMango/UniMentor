//
//  RequestsProfileView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

/// profile of the user clicked from request view
/// param: user
struct RequestsProfileView: View {
    /// user model
    @State var user: User
    /// decline pop up show state
    @State private var showDeclinePopUp: Bool = false
    /// matched pop up show state
    @State private var showMatchPopup: Bool = false
    /// selected user image for match
    @State var selectedUserImage = ""
    /// selected user name for
    @State var selectedUserName = ""
    /// current user image
    @State var currentUserImage = ""
    
    /// link user view model object
    @ObservedObject var LinkUsersVM = LinkUsersViewModel()
    /// user view model object
    @ObservedObject var userVM = UserViewModel()
    
    /// view presentation mode
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                ZStack(alignment: .top) {
                    // Background
                    ZStack {}
                    .frame(minWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
                    .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                    .padding(.top, UIScreen.main.bounds.height * 0.11)
                    // Back Button
                    BackButtonView(action: {
                        // pop child view to go back to requests view
                        presentation.wrappedValue.dismiss()
                    }).padding(.top, UIScreen.main.bounds.height * 0.01)
                    // MAIN
                    VStack {
                        // Profile
                        ProfileView(user: user)
                        // Accept Button
                        VStack {
                            ButtonView(action: {
                                // set selected user image & name info
                                selectedUserImage = user.image
                                selectedUserName = user.name
                                // set current user image
                                currentUserImage = userVM.user?.image ?? "user_image2"
                                // show match popup
                                showMatchPopup = true
                            },
                                 label: "Accept Request",
                                 color: Color("ButtonColor")
                            )
                        }
                        .padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.05, leading: 0, bottom: UIScreen.main.bounds.height * 0.05, trailing: 0))
                        //: Accept Button
                    } //: MAIN
                    // Decline button
                    ZStack {
                        Button(action: {
                            // show decline popup
                            showDeclinePopUp = true
                        }) {
                            Image(systemName: "xmark.circle")
                                .foregroundColor(Color("UnmatchColor"))
                                .font(.system(size: UIScreen.main.bounds.width * 0.07))
                        }
                    }.padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.12, leading: UIScreen.main.bounds.width * 0.88, bottom: 0, trailing: 0))
                    //: Decline button
                }.frame(minHeight: UIScreen.main.bounds.height * 0.5)
            } //: ScrollView
            // POPUP
            // matched popup
            MatchedPopupView(
                show: $showMatchPopup,
                matchedUserName: $selectedUserName,
                matchedUserImage: $selectedUserImage,
                userImage: $currentUserImage,
                action: {
                    // accept request and match user
                    LinkUsersVM.matchUser(user: user)
                    // discard match popup
                    showMatchPopup = false
                    // pop child view to go back to requesst view
                    presentation.wrappedValue.dismiss()
                }
            )
            // decline popup
            PopUpView(
                show: $showDeclinePopUp,
                information: "Decline request from \(user.name)?",
                buttonAction: {
                    // decline request
                    LinkUsersVM.declineUser(user: user)
                    // discard decline popup
                    showMatchPopup = false
                    // pop child view to go back to requesst view
                    presentation.wrappedValue.dismiss()
                },
                buttonText: "Decline"
            )//: POPUP
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        //: ZSTACK
    }
}

struct RequestsProfileView_Previews: PreviewProvider {
    static var previews: some View {
        RequestsProfileView(
            user: User(id: "", name: "", image: "", major: "", school: "", startDate: "", intro: "", matchedUsers: [], sentRequests: [], recievedRequests: [])
        )
    }
}
