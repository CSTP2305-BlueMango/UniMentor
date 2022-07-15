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
    
//    @State var testUser: User = User(id: "", name: "First name", image: "user_image", major: "test", school: "test", startDate: "Sep 2020", intro: "this is for testing", matchedUsers: [], sentRequests: [], recievedRequests: [], messageUsers: [])
//
//    init() {
//        testUser = userVM.user ?? User(id: "", name: "First name", image: "user_image", major: "test", school: "test", startDate: "Sep 2020", intro: "this is for testing", matchedUsers: [], sentRequests: [], recievedRequests: [], messageUsers: [])
//    }
    
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
                    Text("\(userVM.user?.recievedRequests.count ?? 33)")
                    // Card list
                    ScrollView {
                        VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                            ForEach(allUsersVM.users) { user in
                                if !userVM.matchedUsers.contains(user.id) &&
                                    !userVM.sentRequests.contains(user.id) &&
                                    !userVM.recievedRequests.contains(user.id){
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
//        .task {
//            testUser = userVM.user ?? User(id: "", name: "sssss", image: "user_image", major: "test", school: "test", startDate: "Sep 2020", intro: "this is for testing", matchedUsers: [], sentRequests: [], recievedRequests: [], messageUsers: [])
//        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
