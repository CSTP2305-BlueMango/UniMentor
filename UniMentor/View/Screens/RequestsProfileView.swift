//
//  RequestsProfileView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

/// profile of the user clicked from request view
struct RequestsProfileView: View {
    //ref:https://www.cuvenx.com/post/swiftui-pop-to-root-view
    //get presentation mode object - presentation mode object is for poping child view from NavigationView stack
    @Environment(\.presentationMode) var presentation
    /// if pop up showing
    @State private var showDeclinePopUp: Bool = false
    /// if matched pop up showing
    @State private var showMatchPopup: Bool = false
    
    @State var user: User
    
    @ObservedObject var LinkUsersVM = LinkUsersViewModel()
    @ObservedObject var userVM = UserViewModel()
    
    @State var selectedUserImage = ""
    @State var selectedUserName = ""
    @State var currentUserImage = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                ScrollView {
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
                        // MAIN
                        VStack {
                            // Profile
                            ProfileView(user: user)
                            // Accept Button
                            VStack {
                                ButtonView_2(action: {
                                    // accept request
                                    // LinkUsersVM.matchUser(user: user)
                                    selectedUserImage = user.image
                                    selectedUserName = user.name
                                    currentUserImage = userVM.user?.image ?? "user_image2"
                                    showMatchPopup = true
                                },
                                     label: "Accept Request",
                                     color: Color("ButtonColor"),
                                     opacity: 1.0,
                                     isBorder: false
                                )
                            }
                            .padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.05, leading: 0, bottom: UIScreen.main.bounds.height * 0.05, trailing: 0))
                            //: Accept Button
                        } //: MAIN
                        // Decline button
                        ZStack {
                            Button(action: {
                                showDeclinePopUp = true
                            }) {
                                Image(systemName: "xmark.circle")
                                    .foregroundColor(
                                        Color("UnmatchColor"))
                                    .font(.system(size: UIScreen.main.bounds.width * 0.07))
                            }
                        }.padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.12, leading: UIScreen.main.bounds.width * 0.88, bottom: 0, trailing: 0))
                        //: Decline button
                    }.frame(minHeight: UIScreen.main.bounds.height * 0.5)
                }
            }
            //: VSTACK
            // POPUP
            // matched popup
            MatchedPopupView(
                show: $showMatchPopup,
                matchedUserName: $selectedUserName,
                matchedUserImage: $selectedUserImage,
                userImage: $currentUserImage,
                action: {
                    LinkUsersVM.matchUser(user: user)
                    showMatchPopup = false
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
                    showMatchPopup = false
                    presentation.wrappedValue.dismiss()
                },
                buttonText: "Decline"
            )
            //: POPUP
        }//: ZSTACK
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct RequestsProfileView_Previews: PreviewProvider {
    static var previews: some View {
        RequestsProfileView(
            user: User(id: "", name: "First name", image: "user_image", major: "test", school: "test", startDate: "Sep 2020", intro: "this is for testing", matchedUsers: [], sentRequests: [], recievedRequests: [])
        )
    }
}
