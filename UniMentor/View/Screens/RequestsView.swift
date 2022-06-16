//
//  RequestsView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

struct RequestsView: View {
    var body: some View {
        NavigationView {
            // BODY
            VStack(spacing: UIScreen.main.bounds.height * 0.02) {
                Spacer().frame(height: 0).padding(0)
                // HEADER
                HStack {
                    Text("Requests")
                        .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.12))
                    Spacer()
                } //: HEADER
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 0)
                Spacer().frame(height: UIScreen.main.bounds.height * 0.016)
                // MAIN
                VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                    // Text("")
                    // Card list
                    ScrollView {
                        VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                            // TODO: this is gonna be For loop
                            NavigationLink(destination: RequestsProfileView()) {
                                ButtonCardView(
                                    color: Color(red: 0.8627, green: 0.8313, blue: 0.7960),
                                    buttonText: "Accept"
                                )
                            }
                            NavigationLink(destination: RequestsProfileView()) {
                                ButtonCardView(
                                    color: Color(red: 0.8627, green: 0.8313, blue: 0.7960),
                                    buttonText: "Accept"
                                )
                            }
                            NavigationLink(destination: RequestsProfileView()) {
                                ButtonCardView(
                                    color: Color(red: 0.8627, green: 0.8313, blue: 0.7960),
                                    buttonText: "Accept"
                                )
                            }
                            NavigationLink(destination: RequestsProfileView()) {
                                ButtonCardView(
                                    color: Color(red: 0.8627, green: 0.8313, blue: 0.7960),
                                    buttonText: "Accept"
                                )
                            }
                            NavigationLink(destination: RequestsProfileView()) {
                                ButtonCardView(
                                    color: Color(red: 0.8627, green: 0.8313, blue: 0.7960),
                                    buttonText: "Accept"
                                )
                            }
                            NavigationLink(destination: RequestsProfileView()) {
                                ButtonCardView(
                                    color: Color(red: 0.8627, green: 0.8313, blue: 0.7960),
                                    buttonText: "Accept"
                                )
                            }
                            NavigationLink(destination: RequestsProfileView()) {
                                ButtonCardView(
                                    color: Color(red: 0.8627, green: 0.8313, blue: 0.7960),
                                    buttonText: "Accept"
                                )
                            }
                            NavigationLink(destination: RequestsProfileView()) {
                                ButtonCardView(
                                    color: Color(red: 0.8627, green: 0.8313, blue: 0.7960),
                                    buttonText: "Accept"
                                )
                            }
                            NavigationLink(destination: RequestsProfileView()) {
                                ButtonCardView(
                                    color: Color(red: 0.8627, green: 0.8313, blue: 0.7960),
                                    buttonText: "Accept"
                                )
                            }
                        }
                        .padding(UIScreen.main.bounds.width * 0.02)
                    } //: ScrollView
                    Spacer()
                } //: MAIN
                // .frame(height: UIScreen.main.bounds.height * 0.6)
                Spacer()
            } //: BODY
            .frame(height: UIScreen.main.bounds.height * 0.897)
            Spacer()
        } //: NAV_VIEW
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct RequestsView_Previews: PreviewProvider {
    static var previews: some View {
        RequestsView()
    }
}
