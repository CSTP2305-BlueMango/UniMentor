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
                // HEADER
                HStack {
                    Text("Requests")
                        .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.12))
                    Spacer()
                } //: HEADER
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.05)
                Spacer()
                // MAIN
                VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                    // Card list
                    // TODO: make it scrollable
                    VStack(spacing: UIScreen.main.bounds.height * 0.02) {
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
                    }
                    Spacer()
                } //: MAIN
                
//                Text("This is the REQUESTS VIEW")
//                VStack(alignment: .center) {
//                    NavigationLink(destination: RequestsProfileView()) {
//                        Text("To REQUESTS profile")
//                    }
//                }
            } //: BODY
            .frame(height: UIScreen.main.bounds.height * 0.95)
            Spacer()
        } //: NAV_VIEW
    }
}

struct RequestsView_Previews: PreviewProvider {
    static var previews: some View {
        RequestsView()
    }
}
