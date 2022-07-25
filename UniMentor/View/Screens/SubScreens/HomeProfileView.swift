//
//  HomeProfileView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-04.
//

import SwiftUI

/// profile of the user clicked from home view
/// param: user
struct HomeProfileView: View {
    /// user model
    @State var user: User
    
    /// link user view model object
    @ObservedObject var LinkUsersVM = LinkUsersViewModel()
    
    /// view presentation mode
    @Environment(\.presentationMode) var presentation
    
    /// network error
    @State var isErrorOccured: Bool = false;
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                ZStack(alignment: .top) {
                    // Background
                    ZStack {}
                    .frame(minWidth: UIScreen.main.bounds.width * 1, maxHeight: .infinity)
                    .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0).fill(Color.white).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                    .padding(.top, UIScreen.main.bounds.height * 0.11)
                    // BackButton - back to home view
                    BackButtonView(action: {
                        // pop child view to go back to home view
                        presentation.wrappedValue.dismiss()
                    }).padding(.top, UIScreen.main.bounds.height * 0.01)
                    // MAIN
                    VStack {
                        // profile
                        ProfileView(user: $user)
                        // request button
                        VStack{
                            ButtonView(action: {
                                // send match request
                                LinkUsersVM.requestUser(user: user)
                                // pop child view to go back to root view
                                presentation.wrappedValue.dismiss()
                            },
                                 label: "Request for match",
                                 color: Color("ButtonColor")
                            )
                        }.padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.05, leading: 0, bottom: UIScreen.main.bounds.height * 0.05, trailing: 0))
                    } //: MAIN
                }.frame(minHeight: UIScreen.main.bounds.height * 0.5)
            } //: ScrollView
            ErrorPopupView(
                show: $isErrorOccured,
                errorMessage: $LinkUsersVM.errorMessage
            ) {
                LinkUsersVM.errorMessage = ""
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onReceive(LinkUsersVM.$errorMessage) { _ in
            isErrorOccured = !LinkUsersVM.errorMessage.isEmpty;
        }
        //: ZSTACK
    }
}

struct HomeProfileView_Previews: PreviewProvider {
    static var previews: some View {
        HomeProfileView(
            user: User(id: "", name: "", image: "", major: "", school: "", startDate: "", intro: "", matchedUsers: [], sentRequests: [], recievedRequests: [])
        )
    }
}
