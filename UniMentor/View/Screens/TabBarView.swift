//
//  NavigationBar.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

struct TabBarView: View {
    
    @State var isHomeView: Bool = true
    @State var isRequestView: Bool = false
    @State var isMatchView: Bool = false
    @State var isMessageView: Bool = false
    @State var isProfileView: Bool = false
    
    @State var homeButtonColor: Color = .white
    @State var requestsButtonColor: Color = Color("DarkColor")
    @State var matchedButtonColor: Color = Color("DarkColor")
    @State var messagesButtonColor: Color = Color("DarkColor")
    @State var profileButtonColor: Color = Color("DarkColor")
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                if isHomeView {
                    HomeView()
                }
                if isRequestView {
                    RequestsView()
                }
                if isMatchView {
                    MatchedView()
                }
                if isMessageView {
                    MessageView()
                }
                if isProfileView {
                    UserProfile()
                }
            }
            HStack(spacing: UIScreen.main.bounds.width * 0.08) {
                VStack {
                    Button(action: {
                        isHomeView = true
                        isRequestView = false
                        isMatchView = false
                        isMessageView = false
                        isProfileView = false
                        
                        homeButtonColor = .white
                        requestsButtonColor = Color("DarkColor")
                        matchedButtonColor = Color("DarkColor")
                        messagesButtonColor = Color("DarkColor")
                        profileButtonColor = Color("DarkColor")
                    }) {
                        VStack {
                            Image(systemName: "house")
                                .font(.system(size: UIScreen.main.bounds.width * 0.05))
                                .foregroundColor(homeButtonColor)
                            Text("Home")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035)).foregroundColor(homeButtonColor)
                        }.padding(0)
                    }
                }.padding(.top, UIScreen.main.bounds.height * 0.015)
                VStack {
                    Button(action: {
                        isHomeView = false
                        isRequestView = true
                        isMatchView = false
                        isMessageView = false
                        isProfileView = false
                        
                        homeButtonColor = Color("DarkColor")
                        requestsButtonColor = .white
                        matchedButtonColor = Color("DarkColor")
                        messagesButtonColor = Color("DarkColor")
                        profileButtonColor = Color("DarkColor")
                    }) {
                        VStack {
                            Image(systemName: "heart")
                                .foregroundColor(requestsButtonColor)
                                .font(.system(size: UIScreen.main.bounds.width * 0.05))
                            Text("Requests")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035)).foregroundColor(requestsButtonColor)
                        }
                    }
                }.padding(.top, UIScreen.main.bounds.height * 0.015)
                VStack {
                    Button(action: {
                        isHomeView = false
                        isRequestView = false
                        isMatchView = true
                        isMessageView = false
                        isProfileView = false
                        
                        homeButtonColor = Color("DarkColor")
                        requestsButtonColor = Color("DarkColor")
                        matchedButtonColor = .white
                        messagesButtonColor = Color("DarkColor")
                        profileButtonColor = Color("DarkColor")
                    }) {
                        VStack {
                            Image(systemName: "person.2")
                                .foregroundColor(matchedButtonColor)
                                .font(.system(size: UIScreen.main.bounds.width * 0.05))
                            Text("Matched")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035)).foregroundColor(matchedButtonColor)
                        }
                    }
                }.padding(.top, UIScreen.main.bounds.height * 0.015)
                VStack {
                    Button(action: {
                        isHomeView = false
                        isRequestView = false
                        isMatchView = false
                        isMessageView = true
                        isProfileView = false
                        
                        homeButtonColor = Color("DarkColor")
                        requestsButtonColor = Color("DarkColor")
                        matchedButtonColor = Color("DarkColor")
                        messagesButtonColor = .white
                        profileButtonColor = Color("DarkColor")
                    }) {
                        VStack {
                            Image(systemName: "bubble.left")
                                .foregroundColor(messagesButtonColor)
                                .font(.system(size: UIScreen.main.bounds.width * 0.05))
                            Text("Messages")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035)).foregroundColor(messagesButtonColor)
                        }
                    }
                }.padding(.top, UIScreen.main.bounds.height * 0.015)
                VStack {
                    Button(action: {
                        isHomeView = false
                        isRequestView = false
                        isMatchView = false
                        isMessageView = false
                        isProfileView = true
                        
                        homeButtonColor = Color("DarkColor")
                        requestsButtonColor = Color("DarkColor")
                        matchedButtonColor = Color("DarkColor")
                        messagesButtonColor = Color("DarkColor")
                        profileButtonColor = .white
                    }) {
                        VStack {
                            Image(systemName: "person")
                                .foregroundColor(profileButtonColor)
                                .font(.system(size: UIScreen.main.bounds.width * 0.05))
                            Text("Profile")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035)).foregroundColor(profileButtonColor)
                        }
                    }
                }.padding(.top, UIScreen.main.bounds.height * 0.015)
            } //: HSTACK
            .frame(width: UIScreen.main.bounds.width * 1)
            .background(Color("TabBarColor"))
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
