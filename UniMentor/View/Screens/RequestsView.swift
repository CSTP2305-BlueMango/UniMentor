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
                VStack {
                    Spacer()
                    HStack {
                        Text("Requests")
                            .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.12))
                        Spacer()
                    }.frame(width: UIScreen.main.bounds.width * 0.9)
                } //: HEADER
                .frame(height: UIScreen.main.bounds.height * 0.02)
                Spacer().frame(height: UIScreen.main.bounds.height * 0.016)
                // MAIN
                VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                    // Card list
                    ScrollView {
                        VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                            ForEach(0..<10, id: \.self) { num in
                                NavigationLink(destination: RequestsProfileView()) {
                                    ButtonCardView(
                                        color: Color(red: 0.8627, green: 0.8313, blue: 0.7960),
                                        buttonText: "Accept"
                                    )
                                }
                            }                        }
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
