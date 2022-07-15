//
//  HomeProfileView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

/// profile of the user clicked from home view
struct HomeProfileView: View {
    //ref:https://www.cuvenx.com/post/swiftui-pop-to-root-view
    //get presentation mode object - presentation mode object is for poping child view from NavigationView stack
    @Environment(\.presentationMode) var presentation
    
    @State var user: User
    
    @ObservedObject var LinkUsersVM = LinkUsersViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            // BODY
            VStack {
                ScrollView {
                    ZStack(alignment: .top) {
                        // Background
                        ZStack {}
                        .frame(minWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
                        .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                        .padding(.top, UIScreen.main.bounds.height * 0.11)
                        // BackButton
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
                        .padding(.top, UIScreen.main.bounds.height * 0.01)
                        VStack {
                            // profile
                            ProfileView(user: user)
                            // request button
                            VStack{
                                ButtonView_2(action: {
                                    // send match request
                                    LinkUsersVM.requestUser(user: user)
                                    //pop child view to go back to root view
                                    presentation.wrappedValue.dismiss()
                                },
                                     label: "Request for match",
                                     color: Color("ButtonColor"),
                                     opacity: 1.0,
                                     isBorder: false
                                )
                            }
                            .padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.05, leading: 0, bottom: UIScreen.main.bounds.height * 0.05, trailing: 0))
                        }
                    }.frame(minHeight: UIScreen.main.bounds.height * 0.5)
                } //: ScrollView
            }
            //: BODY
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeProfileView_Previews: PreviewProvider {
    static var previews: some View {
        HomeProfileView(
            user: User(id: "", name: "First name", image: "user_image", major: "test", school: "test", startDate: "Sep 2020", intro: "this is for testing", matchedUsers: [], sentRequests: [], recievedRequests: [], messageUsers: [])
        )
    }
}
