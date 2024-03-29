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
    
    /// app view model object
    @EnvironmentObject var viewModel: AppViewModel
    /// all users view model object
    @ObservedObject var allUsersVM = AllUsersViewModel()
    /// user view model object
    @ObservedObject var userVM = UserViewModel()
    
    /// network error
    @State var isErrorOccured: Bool = false;
    
    var body: some View {
        NavigationView {
            // BODY
            ZStack {
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
                    }.frame(height: UIScreen.main.bounds.height * 0.02)
                    //: HEADER
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
                                // loop through all users list
                                ForEach(allUsersVM.users) { user in
                                    // exclude users who are matched, sent request, recieved request with current user
                                    if !userVM.matchedUsers.contains(user.id) &&
                                        !userVM.sentRequests.contains(user.id) &&
                                        !userVM.recievedRequests.contains(user.id){
                                        // get users who matches search input
                                        if searchInput != ""  {
                                            if (user.name.range(of: searchInput, options: .caseInsensitive) != nil) ||
                                                (user.major.range(of: searchInput, options: .caseInsensitive) != nil) ||
                                                (user.school.range(of: searchInput, options: .caseInsensitive) != nil) ||
                                                (user.intro.range(of: searchInput, options: .caseInsensitive) != nil) {
                                                // User card - navigate to HomeProfileView
                                                NavigationLink(destination: HomeProfileView(user: user)) {
                                                    HomeCardView( user: user )
                                                }
                                            }
                                        }
                                        // no search input
                                        else {
                                            // User card - navigate to HomeProfileView
                                            NavigationLink(destination: HomeProfileView(user: user)) {
                                                HomeCardView( user: user )
                                            }
                                        }
                                    }
                                }
                            } .padding(UIScreen.main.bounds.width * 0.02)
                        } //: ScrollView
                    } //: MAIN
                }
                .padding(.top, UIScreen.main.bounds.width * 0.07)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                //: BODY
                //: NAVIGATIONVIEW
                ErrorPopupView(
                    show: $isErrorOccured,
                    errorMessage: $allUsersVM.errorMessage
                ) {
                    allUsersVM.errorMessage = ""
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onReceive(allUsersVM.$errorMessage) {_ in
            isErrorOccured = !allUsersVM.errorMessage.isEmpty
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
