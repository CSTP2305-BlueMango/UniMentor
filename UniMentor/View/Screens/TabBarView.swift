//
//  NavigationBar.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

struct TabBarView: View {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(red: 0.6235, green: 0.5450, blue: 0.4235, alpha: 0)
    }
    
    var body: some View {
    ///reference: https://www.hackingwithswift.com/quick-start/swiftui/adding-tabview-and-tabitem
        TabView {
            HomeView()
                .tabItem {
                    // Label("Home", systemImage: "house")
                    Image(systemName: "house")
                    Text("Home").font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.03))
                }
            RequestsView()
                .tabItem {
                    Label("Requests", systemImage: "heart")
                }
            MatchedView()
                .tabItem {
                    Label("Matched", systemImage: "person.2")
                }
            ChatView()
                .tabItem {
                    Label("Messages", systemImage: "message")
                }
            UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        // .accentColor(.white)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
