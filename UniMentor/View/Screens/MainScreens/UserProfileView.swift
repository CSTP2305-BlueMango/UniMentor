//
//  UserProfile.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

/// display user profile
struct UserProfile: View {
    /// if popup showing
    @State private var showPopUp: Bool = false
    @State private var show: Bool = false
    
    /// state for keeping track of if link to edit profile is active
    @State var isEditActive = false
    
    @State var shouldShowLogOutOptions: Bool = false
    @State var wantToDeleteAccount: Bool = false
    
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject var userVM = UserViewModel()
    
    @State var testUser: User = User(id: "", name: "sssss", image: "user_image", major: "test", school: "test", startDate: "Sep 2020", intro: "this is for testing", matchedUsers: [], sentRequests: [], recievedRequests: [])
    
    
    var body: some View {
        NavigationView {
            ZStack {
                //NAVIGATION LINK
                NavigationLink(
                    destination: UserProfileEditView(
                        major: testUser.major,
                        school: testUser.school,
                        // TODO: should be fixed
                        month: "\(separateDate(startDate: testUser.startDate)[0])",
                        year: "\(separateDate(startDate: testUser.startDate)[1])",
                        info: testUser.intro
                    ),
                    isActive: $isEditActive
                ) {EmptyView()}
                //:NAVIGATION LINK
                
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
                                // Text("\(userVM.user?.school ?? "no")")
                                ProfileView(user: testUser)
                                    .padding(.bottom, UIScreen.main.bounds.height * 0.05)
                            }
                            
                            // reference: https://www.hackingwithswift.com/quick-start/swiftui/how-to-show-a-menu-when-a-button-is-pressed
                            // Setting Button
                            ZStack {
                                Menu {
                                    // Edit button
                                    Button {
                                        isEditActive = true
                                    } label: {
                                        Label("Edit profile", systemImage: "square.and.pencil")
                                    }
                                    // log out button
                                    Button {
                                        shouldShowLogOutOptions.toggle()
                                    } label: {
                                        Label("Log out", systemImage: "rectangle.portrait.and.arrow.right")
                                    }
                                    Button {
                                        // TODO: delete account feature
                                        wantToDeleteAccount = true
                                        // userVM.deleteUser()
                                    } label: {
                                        Label("Delete account", systemImage: "person.crop.circle.badge.xmark")
                                    }
                                } label: {
                                    Image(systemName: "gearshape")
                                        .font(.system(size: UIScreen.main.bounds.width * 0.07))
                                        .foregroundColor(Color.black)
                                }
                            }.padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.12, leading: UIScreen.main.bounds.width * 0.88, bottom: 0, trailing: 0))
                            // Information button
                            ZStack {
                                Button(action: {
                                    showPopUp = true
                                }) {
                                    Image(systemName: "exclamationmark.square")
                                        .font(.system(size: UIScreen.main.bounds.width * 0.07))
                                        .foregroundColor(Color.black)
                                }
                            }.padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.12, leading: -UIScreen.main.bounds.width * 0.48, bottom: 0, trailing: 0))
                        }.frame(minHeight: UIScreen.main.bounds.height * 0.5)
                        // FOOTER
                        VStack(spacing: UIScreen.main.bounds.height * 0.01) {
                            Text("Matched students")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                            Text("\(testUser.matchedUsers.count)")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                        }
                        .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.1)
                        .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                        .padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.01, leading: 0, bottom: UIScreen.main.bounds.height * 0.02, trailing: 0))
                        //: FOOTER
                    }//: ScrollView
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                //: BODY
                // POPUP
                InfoPopupView(show: $showPopUp)
                PopUpView(
                    show: $wantToDeleteAccount,
                    information: "Do you want to delete account?",
                    warnMessage: "* all the information of the account will be remove completely",
                    buttonAction: {
                        userVM.deleteUser()
                        wantToDeleteAccount = false
                        show = true
                    },
                    buttonText: "Delete"
                )
                // Log out after delete account
                if show {
                    // background
                    Color.black.opacity(show ? 0.3 : 0).edgesIgnoringSafeArea(.all)
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
                                viewModel.signOut()
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
                    //: Popup
                }//: IF SHOW
            }
            .actionSheet(isPresented: $shouldShowLogOutOptions) {
                .init(title: Text("Settings"), message: Text("Do you want to log out?"), buttons: [
                    .destructive(Text("Log Out"), action: {
                        viewModel.signOut()
                    }),
                        .cancel()
                ])
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
//        .task {
//            testUser = userVM.user ?? User(id: "", name: "sssss", image: "user_image", major: "test", school: "test", startDate: "Sep 2020", intro: "this is for testing", matchedUsers: [], sentRequests: [], recievedRequests: [], messageUsers: [])
//        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}

func separateDate(startDate: String) -> [String] {
    let result = startDate.components(separatedBy: " ")
    // print("\(result)")
    return result
}