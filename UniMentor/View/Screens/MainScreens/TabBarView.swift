//
//  NavigationBar.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI
import Firebase

/// buttom tab bar
struct TabBarView: View {
    
    /// if home view button clicked
    @State var isHomeView: Bool = true
    /// if request view button clicked
    @State var isRequestView: Bool = false
    /// if match view button clicked
    @State var isMatchView: Bool = false
    /// if message view button clicked
    @State var isMessageView: Bool = false
    /// if profile view button clicked
    @State var isProfileView: Bool = false
    
    /// home view button color
    @State var homeButtonColor: Color = .white
    /// request view button color
    @State var requestsButtonColor: Color = Color("DarkColor")
    /// match view button color
    @State var matchedButtonColor: Color = Color("DarkColor")
    /// message view button color
    @State var messagesButtonColor: Color = Color("DarkColor")
    /// profile view button color
    @State var profileButtonColor: Color = Color("DarkColor")
    
    /// user view model object
    @ObservedObject var userVM = UserViewModel()
    
    var body: some View {
        // BODY
        VStack(spacing: 0) {
            VStack {
                // display home view
                if isHomeView {
                    HomeView()
                }
                // display request view
                if isRequestView {
                    RequestsView()
                }
                // display matched view
                if isMatchView {
                    MatchedView(
                        isMatchView: $isMatchView,
                        isMessageView: $isMessageView,
                        matchedButtonColor: $matchedButtonColor,
                        messagesButtonColor: $messagesButtonColor
                    )
                }
                // display message view
                if isMessageView {
                    MessageView()
                }
                // display profile view
                if isProfileView {
                    UserProfile(user: userVM.user ?? User(id: "", name: "", image: "", major: "", school: "", startDate: "", intro: "", matchedUsers: [], sentRequests: [], recievedRequests: []))
                }
            }
            // TABBAR
            HStack(spacing: UIScreen.main.bounds.width * 0.08) {
                // Home view button
                VStack {
                    Button(action: {
                        // home view active
                        isHomeView = true
                        isRequestView = false
                        isMatchView = false
                        isMessageView = false
                        isProfileView = false
                        // home view tab icon to be white
                        homeButtonColor = .white
                        requestsButtonColor = Color("DarkColor")
                        matchedButtonColor = Color("DarkColor")
                        messagesButtonColor = Color("DarkColor")
                        profileButtonColor = Color("DarkColor")
                    }) {
                        VStack {
                            // Home icon
                            Image(systemName: "house")
                                .font(.system(size: UIScreen.main.bounds.width * 0.05))
                                .foregroundColor(homeButtonColor)
                            // Home text
                            Text("Home")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035)).foregroundColor(homeButtonColor)
                        }.padding(0)
                    }
                }.padding(.top, UIScreen.main.bounds.height * 0.015)
                // Request view button
                VStack {
                    Button(action: {
                        // request view active
                        isHomeView = false
                        isRequestView = true
                        isMatchView = false
                        isMessageView = false
                        isProfileView = false
                        // request view tab icon to be white
                        homeButtonColor = Color("DarkColor")
                        requestsButtonColor = .white
                        matchedButtonColor = Color("DarkColor")
                        messagesButtonColor = Color("DarkColor")
                        profileButtonColor = Color("DarkColor")
                    }) {
                        VStack {
                            // Requests icon
                            Image(systemName: "heart")
                                .foregroundColor(requestsButtonColor)
                                .font(.system(size: UIScreen.main.bounds.width * 0.05))
                            // Reqests text
                            Text("Requests")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035)).foregroundColor(requestsButtonColor)
                        }
                    }
                }.padding(.top, UIScreen.main.bounds.height * 0.015)
                // Matched view button
                VStack {
                    Button(action: {
                        // matched view active
                        isHomeView = false
                        isRequestView = false
                        isMatchView = true
                        isMessageView = false
                        isProfileView = false
                        // matched view tab icon to be white
                        homeButtonColor = Color("DarkColor")
                        requestsButtonColor = Color("DarkColor")
                        matchedButtonColor = .white
                        messagesButtonColor = Color("DarkColor")
                        profileButtonColor = Color("DarkColor")
                    }) {
                        VStack {
                            // Matched icon
                            Image(systemName: "person.2")
                                .foregroundColor(matchedButtonColor)
                                .font(.system(size: UIScreen.main.bounds.width * 0.05))
                            // Matched text
                            Text("Matched")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035)).foregroundColor(matchedButtonColor)
                        }
                    }
                }.padding(.top, UIScreen.main.bounds.height * 0.015)
                // Message view button
                VStack {
                    Button(action: {
                        // message view active
                        isHomeView = false
                        isRequestView = false
                        isMatchView = false
                        isMessageView = true
                        isProfileView = false
                        // message view tab icon to be white
                        homeButtonColor = Color("DarkColor")
                        requestsButtonColor = Color("DarkColor")
                        matchedButtonColor = Color("DarkColor")
                        messagesButtonColor = .white
                        profileButtonColor = Color("DarkColor")
                    }) {
                        VStack {
                            // Message icon
                            Image(systemName: "bubble.left")
                                .foregroundColor(messagesButtonColor)
                                .font(.system(size: UIScreen.main.bounds.width * 0.05))
                            // Message text
                            Text("Messages")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035)).foregroundColor(messagesButtonColor)
                        }
                    }
                }.padding(.top, UIScreen.main.bounds.height * 0.015)
                // Profile view button
                VStack {
                    Button(action: {
                        // profile view active
                        isHomeView = false
                        isRequestView = false
                        isMatchView = false
                        isMessageView = false
                        isProfileView = true
                        // profile view tab icon to be white
                        homeButtonColor = Color("DarkColor")
                        requestsButtonColor = Color("DarkColor")
                        matchedButtonColor = Color("DarkColor")
                        messagesButtonColor = Color("DarkColor")
                        profileButtonColor = .white
                    }) {
                        VStack {
                            // Profile icon
                            Image(systemName: "person")
                                .foregroundColor(profileButtonColor)
                                .font(.system(size: UIScreen.main.bounds.width * 0.05))
                            // Profile text
                            Text("Profile")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035)).foregroundColor(profileButtonColor)
                        }
                    }
                }.padding(.top, UIScreen.main.bounds.height * 0.015)
            }
            .frame(width: UIScreen.main.bounds.width * 1)
            .background(Color("TabBarColor"))
            //: TABBAR
        } //: BODY
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
