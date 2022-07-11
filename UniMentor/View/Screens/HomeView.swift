//
//  HomeView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

/// display list of other users available to match with search function
struct HomeView: View {
    /// search input
    @State var searchInput: String = ""
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
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
                            .padding(.leading, -UIScreen.main.bounds.width * 0.07)
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
                                    // TODO: actual info
                                    HomeCardView(
                                        userID: "1",
                                        image: "user_image",
                                        name: "First Lastname",
                                        major: "Computer Systems Technology",
                                        school: "Vancouver Community college",
                                        information: """
    I guess we could discuss the implications of the phrase meant to be.

    That is if we wanted to drown ourselves in a sea of backwardly referential semantics and other mumbo-jumbo.
    """
                                    )
                                }
                            }
                        }
                        .padding(UIScreen.main.bounds.width * 0.02)
                        ButtonView_2(
                            action: {
                                viewModel.signOut()
                            },
                            label: "Sign out",
                            color: Color(
                               red: 1,
                                green: 1,
                                blue: 1
                            ),
                            opacity: 0.0,
                            isBorder: true
                        )
                    } //: ScrollView
                } //: MAIN
            }
            .padding(.top, UIScreen.main.bounds.width * 0.07)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            //: BODY
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
