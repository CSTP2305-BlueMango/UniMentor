//
//  NavigationBar.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        NavigationView {
            
        ///reference: https://www.hackingwithswift.com/quick-start/swiftui/adding-tabview-and-tabitem
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
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
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
