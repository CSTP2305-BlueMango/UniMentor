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
    
    @ObservedObject var allUsersVM = AllUsersViewModel()
    @ObservedObject var userVM = UserViewModel()
    
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
                            .autocapitalization(.none)
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.05)
                    .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.05).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                    // Card list
                    ScrollView {
                        VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                            ForEach(allUsersVM.users) { user in
                                if !userVM.matchedUsers.contains(user.id) &&
                                    !userVM.sentRequests.contains(user.id) &&
                                    !userVM.recievedRequests.contains(user.id){
                                    if searchInput != ""  {
                                        if (user.name.range(of: searchInput, options: .caseInsensitive) != nil) ||
                                            (user.major.range(of: searchInput, options: .caseInsensitive) != nil) ||
                                            (user.school.range(of: searchInput, options: .caseInsensitive) != nil) ||
                                            (user.intro.range(of: searchInput, options: .caseInsensitive) != nil) {
                                            NavigationLink(destination: HomeProfileView(user: user)) {
                                                // TODO: actual info
                                                HomeCardView(
                                                    userID: user.id,
                                                    image: user.image,
                                                    name: user.name,
                                                    major: user.major,
                                                    school: user.school,
                                                    information: user.intro
                                                )
                                            }
                                        }
                                    }
                                    else {
                                        NavigationLink(destination: HomeProfileView(user: user)) {
                                            // TODO: actual info
                                            HomeCardView(
                                                userID: user.id,
                                                image: user.image,
                                                name: user.name,
                                                major: user.major,
                                                school: user.school,
                                                information: user.intro
                                            )
                                        }
                                    }
                                }
                            }
                        }
                        .padding(UIScreen.main.bounds.width * 0.02)
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
