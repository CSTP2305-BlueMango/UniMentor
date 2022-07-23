//
//  ProfileConfirmView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-22.
//

import SwiftUI

/// confirm profile information of user edited from profileInfo view
/// param: user name, image, major, school, startDate, information
struct ProfileConfirmView: View {
    /// confirm name
    @State var name: String
    /// confirm image
    @State var image: UIImage?
    /// confirm major
    @State var major: String
    /// confirm school
    @State var school: String
    /// confirm start date
    @State var startDate: String
    /// confirm information
    @State var info: String
    /// profile confirm finished state
    @State var isFinished = false
    /// user view model object
    @ObservedObject var userVM = UserViewModel()
    /// image view model object
    @ObservedObject private var imageVM = ImageViewModel()
    /// view presentation mode
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack(alignment: .top) {
            // BACKGROUND
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            // NAVIGATION LINK - navigate to login view
            NavigationLink(
                destination: LoginView(),
                isActive: $isFinished
            ) {EmptyView()}
            
            // SCROLLVIEW
            ScrollView {
                // BODY
                VStack(spacing: UIScreen.main.bounds.height * 0.05) {
                    ZStack(alignment: .top) {
                        // Background
                        ZStack {}
                        .frame(minWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
                        .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                        .padding(.top, UIScreen.main.bounds.height * 0.11)
                        // Profile view
                        VStack {
                            ProfileView(user: User(id: "", name: self.name, image: "", major: self.major, school: self.school, startDate: self.startDate, intro: self.info, matchedUsers: [], sentRequests: [], recievedRequests: []), isImageUIImage: true, uiImage: self.image)
                                .padding(.bottom, UIScreen.main.bounds.height * 0.05)
                        }
                    }.frame(minHeight: UIScreen.main.bounds.height * 0.5)
                    // FOOTER
                    VStack() {
                        // Finish button - save user profile information to database and go to login view
                        ButtonView(action: {
                            // save user infomation to database
                            userVM.saveUser(createdUser: User(
                                id: "",
                                name: name,
                                image: ImageViewModel.imageUrl,
                                major: major,
                                school: school,
                                startDate: startDate,
                                intro: info,
                                matchedUsers: [],
                                sentRequests: [],
                                recievedRequests: [])
                            )
                            // finish sign up and go to login page
                            isFinished = true
                        },
                             label: "Get Started",
                             color: Color("TabBarColor")
                        )
                    } //: FOOTER
                }.frame(minHeight: UIScreen.main.bounds.height * 0.9)
                //: BODY
            }//: ScrollView
            // Back button - go back to profile information view
            HStack {
                Button(action: {
                    // pop child view to go back to root view
                    presentation.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.black)
                        .font(.system(size: UIScreen.main.bounds.width * 0.06))
                }
                Spacer()
            }.frame(width: UIScreen.main.bounds.width * 0.9)
        }.hideNavigationBar()
        //: ZSTACK
    }
}

struct ProfileConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileConfirmView(
            name: "",
            major: "",
            school: "",
            startDate: "",
            info: ""
        )
    }
}
