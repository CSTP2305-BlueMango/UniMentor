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
    
    /// state for keeping track of if link to edit profile is active
    @State var isEditActive = false
    
    @ObservedObject var userVM = UserViewModel()
    
    @State var testUser: User = User(id: "", name: "sssss", image: "user_image", major: "test", school: "test", startDate: "Sep 2020", intro: "this is for testing", matchedUsers: [], sentRequests: [], recievedRequests: [], messageUsers: [])
    
    
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
                                Text("\(userVM.user?.name ?? "no")")
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
                                        // TODO: log out feature
                                    } label: {
                                        Label("Log out", systemImage: "rectangle.portrait.and.arrow.right")
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
    print("\(result)")
    return result
}
