//
//  RequestsView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

/// display list of users sent requests to current user
struct RequestsView: View {
    /// matched pop up show state
    @State private var showPopUp: Bool = false
    /// selected user image to match
    @State var selectedUserImage = ""
    /// selected user name to match
    @State var selectedUserName = ""
    /// current user image
    @State var currentUserImage = ""
    
    /// user view model object
    @ObservedObject var userVM = UserViewModel()
    /// link users view model object
    @ObservedObject var LinkUsersVM = LinkUsersViewModel()
    
    /// network error
    @State var isErrorOccured: Bool = false;
    
    var body: some View {
        NavigationView {
            ZStack {
                // BODY
                VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                    // HEADER
                    VStack {
                        Spacer()
                        // Title
                        HStack {
                            Text("Requests")
                                .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.12))
                            Spacer()
                        }.frame(width: UIScreen.main.bounds.width * 0.9)
                    }.frame(height: UIScreen.main.bounds.height * 0.02)
                    //: HEADER
                    // MAIN
                    VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                        // Card list
                        ScrollView {
                            VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                                // loop through requested user
                                ForEach(userVM.recievedRequestsModel) { user in
                                    // User card with match button - naviagate to RequestsProfileView
                                    NavigationLink(destination: RequestsProfileView(user: user)) {
                                        ButtonCardView(
                                            action: {
                                                // accept request
                                                LinkUsersVM.matchUser(user: user)
                                                // set selected user image & name
                                                selectedUserImage = user.image
                                                selectedUserName = user.name
                                                // set current user image
                                                currentUserImage = userVM.user?.image ?? "user_image2"
                                                // show matched popup
                                                showPopUp = true
                                            },
                                            image: user.image,
                                            name: user.name,
                                            major: user.major,
                                            school: user.school
                                        )
                                    }
                                }
                            }
                            .padding(UIScreen.main.bounds.width * 0.02)
                        } //: ScrollView
                    } //: MAIN
                }
                .padding(.top, UIScreen.main.bounds.width * 0.02)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                //: BODY
                // POPUP - matched notify popup
                MatchedPopupView(
                    show: $showPopUp,
                    matchedUserName: $selectedUserName,
                    matchedUserImage: $selectedUserImage,
                    userImage: $currentUserImage,
                    action: {
                        // discard popup
                        showPopUp = false
                    }
                )//: POPUP
                ErrorPopupView(
                    show: $isErrorOccured,
                    errorMessage: Binding(get: {
                        "\(userVM.errorMessage)\n\(LinkUsersVM.errorMessage)"
                    }, set: {_ in})
                ) {
                    userVM.errorMessage = "";
                    LinkUsersVM.errorMessage = "";
                }
            }//: ZSTACK
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onReceive(userVM.$errorMessage) { _ in
            isErrorOccured = !userVM.errorMessage.isEmpty;
        }
        .onReceive(LinkUsersVM.$errorMessage) {
            _ in isErrorOccured = !LinkUsersVM.errorMessage.isEmpty
        }
    }
}

struct RequestsView_Previews: PreviewProvider {
    static var previews: some View {
        RequestsView()
    }
}
