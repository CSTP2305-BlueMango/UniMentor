//
//  RequestsView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

/// display list of users sent requests to current user
struct RequestsView: View {
    /// if pop up showing
    @State private var showPopUp: Bool = false
    
    @ObservedObject var userVM = UserViewModel()
    @ObservedObject var LinkUsersVM = LinkUsersViewModel()
    
    @State var testUser: User = User(id: "", name: "First name", image: "user_image", major: "test", school: "test", startDate: "Sep 2020", intro: "this is for testing", matchedUsers: [], sentRequests: [], recievedRequests: [], messageUsers: [])
    
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
                    } //: HEADER
                    .frame(height: UIScreen.main.bounds.height * 0.02)
                    // MAIN
                    VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                        // Card list
                        ScrollView {
                            VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                                ForEach(userVM.recievedRequestsModel) { user in
                                    NavigationLink(destination: RequestsProfileView(user: user)) {
                                        ButtonCardView(
                                            action: {
                                                // TODO: accept request
                                                LinkUsersVM.matchUser(user: user)
                                                showPopUp = true
                                            },
                                            userID: user.id,
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
                // POPUP
                MatchedPopupView(
                    show: $showPopUp,
                    matchedUserName: "First Lastname",
                    matchedUserImage: "user_image2",
                    userImage: "user_image",
                    action: {
                        showPopUp = false
                    }
                )
                //: POPUP
            }//: ZSTACK
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct RequestsView_Previews: PreviewProvider {
    static var previews: some View {
        RequestsView()
    }
}
