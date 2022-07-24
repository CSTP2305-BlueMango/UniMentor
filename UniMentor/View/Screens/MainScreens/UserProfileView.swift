//
//  UserProfile.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

/// display user profile
struct UserProfile: View {
    /// edit profile active state
    @State var isEditActive = false
    /// information popup show state
    @State private var showInfoPopUp: Bool = false
    /// logout button show state
    @State var shouldShowLogOutOptions: Bool = false
    /// delete account popup show state
    @State var wantToDeleteAccount: Bool = false
    /// logout popup after delete account show state
    @State private var showDeleteLogoutPopup: Bool = false
    /// empty user when user model doesn't exist
    @State var user: User = User(id: "", name: "", image: "", major: "", school: "", startDate: "", intro: "", matchedUsers: [], sentRequests: [], recievedRequests: [])
    
    /// user view model object
    @ObservedObject var userVM = UserViewModel()
    /// app view model object
    @EnvironmentObject var appVM: AppViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                //NAVIGATION LINK - navigate to user profile edit view
                NavigationLink(
                    destination: UserProfileEditView(),
                    isActive: $isEditActive
                ) {EmptyView()}
                
                // BODY
                VStack {
                    ScrollView {
                        ZStack(alignment: .top) {
                            // Background
                            ZStack {}
                            .frame(minWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
                            .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                            .padding(.top, UIScreen.main.bounds.height * 0.11)
                            VStack {
                                // profile
                                ProfileView(user: userVM.user ?? user)
                                    .padding(.bottom, UIScreen.main.bounds.height * 0.05)
                            }
                            // reference: https://www.hackingwithswift.com/quick-start/swiftui/how-to-show-a-menu-when-a-button-is-pressed
                            // Settings
                            ZStack {
                                Menu {
                                    // Edit button
                                    Button {
                                        // go to user profile edit view
                                        isEditActive = true
                                    } label: {
                                        Label("Edit profile", systemImage: "square.and.pencil")
                                    }
                                    // Information button
                                    Button {
                                        // show information popup
                                        showInfoPopUp = true
                                    } label: {
                                        Label("About", systemImage: "exclamationmark.square")
                                    }
                                    // log out button
                                    Button {
                                        // show logout button
                                        shouldShowLogOutOptions.toggle()
                                    } label: {
                                        Label("Log out", systemImage: "rectangle.portrait.and.arrow.right")
                                    }
                                    Button(role: .destructive) {
                                        // delete account popup
                                        wantToDeleteAccount = true
                                    } label: {
                                        Label("Delete account", systemImage: "person.crop.circle.badge.xmark").foregroundColor(.red)
                                    }.foregroundColor(.red)
                                } label: {
                                    // Settings Icon
                                    Image(systemName: "gearshape")
                                        .font(.system(size: UIScreen.main.bounds.width * 0.07))
                                        .foregroundColor(Color.black)
                                }
                            }
                            .padding(.top, UIScreen.main.bounds.height * 0.12)
                            .padding(.leading, UIScreen.main.bounds.width * 0.88)
                        }.frame(minHeight: UIScreen.main.bounds.height * 0.5)
                        // FOOTER
                        // Number of matched users
                        VStack(spacing: UIScreen.main.bounds.height * 0.01) {
                            Text("Matched students")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                            Text("\(userVM.user?.matchedUsers.count ?? 0)")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                        }
                        .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.1)
                        .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                        .padding(.top, UIScreen.main.bounds.height * 0.01)
                        .padding(.bottom, UIScreen.main.bounds.height * 0.02)
                        //: FOOTER
                    }//: ScrollView
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                //: BODY
                // POPUPS
                // Information popup
                InfoPopupView(show: $showInfoPopUp)
                // Delete account popup
                PopUpView(
                    show: $wantToDeleteAccount,
                    information: "Do you want to delete account?",
                    warnMessage: "* all the information of the account will be remove completely",
                    buttonAction: {
                        // delete user account
                        userVM.deleteUser()
                        // discard delete popup
                        wantToDeleteAccount = false
                        // show logout popup
                        showDeleteLogoutPopup = true
                    },
                    buttonText: "Delete"
                )
                // Logout popup after delete account
                if showDeleteLogoutPopup {
                    // background
                    Color.black.opacity(showDeleteLogoutPopup ? 0.3 : 0).edgesIgnoringSafeArea(.all)
                    // TODO: change to component
                    // Popup
                    VStack(spacing: UIScreen.main.bounds.height * 0.03) {
                        VStack(spacing: UIScreen.main.bounds.height * 0.01) {
                            // popup message
                            Text("Finished Deleting account. Please Log out")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.06))
                                .multilineTextAlignment(.center)
                        }
                        HStack(spacing: UIScreen.main.bounds.width * 0.07) {
                            // button
                            Button(action: {
                                // sign out user
                                appVM.signOut()
                            }) {
                                Text("Log out")
                                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                                    .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.width * 0.12)
                                    .background(Color("UnmatchColor").cornerRadius(UIScreen.main.bounds.width * 0.1).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                                    .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.7)
                    .padding(UIScreen.main.bounds.width * 0.07)
                    .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.04).fill(Color.white))
                } //: Logout popup after delete account
                //: POPUPS
            }
            // Logout button
            .actionSheet(isPresented: $shouldShowLogOutOptions) {
                .init(title: Text("Settings"), message: Text("Do you want to log out?"), buttons: [
                    .destructive(Text("Log Out"), action: {
                        // sign out user
                        appVM.signOut()
                    }),
                        .cancel()
                ])
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        //: NAVIGATIONVIEW
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}


