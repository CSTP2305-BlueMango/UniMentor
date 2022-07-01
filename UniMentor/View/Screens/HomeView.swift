//
//  HomeView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

/// home view
struct HomeView: View {
    /// search input
    @State var searchInput: String = ""
    var body: some View {
        // BODY
        VStack(spacing: UIScreen.main.bounds.height * 0.06) {
            // HEADER
            VStack {
                Spacer()
                // Logo
                HStack {
                    Image("SmallLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.width * 0.25)
                        .padding(EdgeInsets(top: 0, leading: -UIScreen.main.bounds.width * 0.07, bottom: 0, trailing: 0))
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width * 0.9)
            } //: HEADER
            .frame(height: UIScreen.main.bounds.height * 0.02)
            // MAIN
            VStack(spacing: UIScreen.main.bounds.height * 0.02) {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(
                            Color.gray)
                        .frame(width: UIScreen.main.bounds.width * 0.05)
                    TextField("Search", text: $searchInput)
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.05)
                .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.05).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                // Card list
                ScrollView {
                    VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                        ForEach(0..<2, id: \.self) { num in
                            NavigationLink(destination: HomeProfileView()) {
                                HomeCardView()
                            }
                        }
                    }
                    .padding(UIScreen.main.bounds.width * 0.02)
                } //: ScrollView
            } //: MAIN
        }
        .padding(.top, UIScreen.main.bounds.width * 0.07)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        //: BODY
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
