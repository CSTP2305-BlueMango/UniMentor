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
                    ChatView()
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
                    }) {
                        VStack {
                            Image(systemName: "house")
                                .foregroundColor(Color.white)
                                .font(.system(size: UIScreen.main.bounds.width * 0.05))
                            Text("Home")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035)).foregroundColor(Color.white)
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
                    }) {
                        VStack {
                            Image(systemName: "heart")
                                .foregroundColor(Color("DarkColor"))
                                .font(.system(size: UIScreen.main.bounds.width * 0.05))
                            Text("Requests")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035)).foregroundColor(Color("DarkColor"))
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
                    }) {
                        VStack {
                            Image(systemName: "person.2")
                                .foregroundColor(Color("DarkColor"))
                                .font(.system(size: UIScreen.main.bounds.width * 0.05))
                            Text("Matched")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035)).foregroundColor(Color("DarkColor"))
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
                    }) {
                        VStack {
                            Image(systemName: "bubble.left")
                                .foregroundColor(Color("DarkColor"))
                                .font(.system(size: UIScreen.main.bounds.width * 0.05))
                            Text("Messages")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035)).foregroundColor(Color("DarkColor"))
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
                    }) {
                        VStack {
                            Image(systemName: "person")
                                .foregroundColor(Color("DarkColor"))
                                .font(.system(size: UIScreen.main.bounds.width * 0.05))
                            Text("Profile")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035)).foregroundColor(Color("DarkColor"))
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
