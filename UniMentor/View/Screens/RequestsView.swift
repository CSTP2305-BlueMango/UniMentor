//
//  RequestsView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

/// display list of users sent requests to current user
struct RequestsView: View {
    /// if pop up showing
    @State private var showPopUp: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // BODY
                VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                    // HEADER
                    VStack {
                        Spacer()
                        // Title
                        HStack {
                            Text("Requests")
                                .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.12))
                            Spacer()
                        }.frame(width: UIScreen.main.bounds.width * 0.9)
                    } //: HEADER
                    .frame(height: UIScreen.main.bounds.height * 0.02)
                    // MAIN
                    VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                        // Card list
                        ScrollView {
                            VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                                ForEach(0..<10, id: \.self) { num in
                                    NavigationLink(destination: RequestsProfileView()) {
                                        // TODO: actual info
                                        ButtonCardView(
                                            action: {
                                                // TODO: accept request
                                                showPopUp = true
                                            },
                                            userID: "1",
                                            image: "user_image",
                                            name: "First Lastname",
                                            major: "Computer Systems Technology",
                                            school: "Vancouver Community college"
                                        )
                                    }
                                }
                            }
                            .padding(UIScreen.main.bounds.width * 0.02)
                        } //: ScrollView
                    } //: MAIN
                }
                .padding(.top, UIScreen.main.bounds.width * 0.02)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                //: BODY
                // POPUP
                MatchedPopupView(
                    show: $showPopUp,
                    matchedUserName: "First Lastname",
                    matchedUserImage: "user_image2",
                    userImage: "user_image",
                    action: {
                        showPopUp = false
                    }
                )
                //: POPUP
            }//: ZSTACK
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct RequestsView_Previews: PreviewProvider {
    static var previews: some View {
        RequestsView()
    }
}
