//
//  ProfileConfirmView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-22.
//

import SwiftUI

/// confirm profile information of user edited from profileInfo view
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
    
    @State var isFinished = false
    
    @ObservedObject var userVM = UserViewModel()
    
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject private var imageVM = ImageViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            //NAVIGATION LINK
            NavigationLink(
                destination: LoginView(),
                isActive: $isFinished
            ) {EmptyView()}
            //:NAVIGATION LINK
            
            ScrollView {
                // BODY
                VStack(spacing: UIScreen.main.bounds.height * 0.05) {
                    ZStack(alignment: .top) {
                        // Background
                        ZStack {}
                        .frame(minWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
                        .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                        .padding(.top, UIScreen.main.bounds.height * 0.11)
                        VStack {
                            // TODO: actual info Image
                            ProfileView(user: User(id: "", name: self.name, image: "", major: self.major, school: self.school, startDate: self.startDate, intro: self.info, matchedUsers: [], sentRequests: [], recievedRequests: []), isImageUIImage: true, uiImage: self.image)
                                .padding(.bottom, UIScreen.main.bounds.height * 0.05)
                        }
                    }.frame(minHeight: UIScreen.main.bounds.height * 0.5)
                    // FOOTER
                    VStack() {
                        // finish button
                        ButtonView_2(action: {
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
                            
                            // TODO: finish sign up and go to main page
                            isFinished = true
                        },
                             label: "Get Started",
                             color: Color("TabBarColor"),
                             opacity: 1.0,
                             isBorder: false
                        )
                    } //: FOOTER
                }.frame(minHeight: UIScreen.main.bounds.height * 0.9)
                //: BODY
            }//: ScrollView
            
            HStack {
                Button(action: {
                    presentation.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.black)
                        .font(.system(size: UIScreen.main.bounds.width * 0.06))
                }
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width * 0.9)
        }
        .hideNavigationBar()
        //: ZSTACK
    }
}

struct ProfileConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileConfirmView(
            name: "First Lastname",
            major: "Computer Systems Technology",
            school: "Vancouver Community College",
            startDate: "September 2020",
            info: """
                I guess we could discuss the implications of the phrase meant to be.

                That is if we wanted to drown ourselves in a sea of backwardly referential semantics and other mumbo-jumbo.
                """
        )
    }
}
