//
//  HomeView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

struct HomeView: View {
    @State var searchInput: String = ""
    var body: some View {
        NavigationView {
            // BODY
            VStack(spacing: UIScreen.main.bounds.height * 0.02) {
                // HEADER
                HStack {
                    Text("UniMentor")
                        .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.12))
                    Spacer()
                } //: HEADER
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.05)
                Spacer()
                // MAIN
                VStack(spacing: UIScreen.main.bounds.height * 0.04) {
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
                    // Card list
                    // TODO: make it scrollable
                    VStack(spacing: UIScreen.main.bounds.height * 0.02) {
                        // TODO: this is gonna be For loop
                        NavigationLink(destination: HomeProfileView()) {
                            ButtonCardView(
                                color: Color(red: 0.8627, green: 0.8313, blue: 0.7960),
                                buttonText: "Match"
                            )
                        }
                        NavigationLink(destination: HomeProfileView()) {
                            ButtonCardView(
                                color: Color(red: 0.8627, green: 0.8313, blue: 0.7960),
                                buttonText: "Match"
                            )
                        }
                        NavigationLink(destination: HomeProfileView()) {
                            ButtonCardView(
                                color: Color(red: 0.8627, green: 0.8313, blue: 0.7960),
                                buttonText: "Match"
                            )
                        }
                        NavigationLink(destination: HomeProfileView()) {
                            ButtonCardView(
                                color: Color(red: 0.8627, green: 0.8313, blue: 0.7960),
                                buttonText: "Match"
                            )
                        }
                        NavigationLink(destination: HomeProfileView()) {
                            ButtonCardView(
                                color: Color(red: 0.8627, green: 0.8313, blue: 0.7960),
                                buttonText: "Match"
                            )
                        }
                    }
                    Spacer()
                } //: MAIN
                    
//                Text("This is the HOME VIEW")
//                VStack(alignment: .center) {
//                    NavigationLink(destination: HomeProfileView()) {
//                        Text("To profile")
//                    }
//                }
            } //: BODY
            .frame(height: UIScreen.main.bounds.height * 0.95)
            Spacer()
        } //: NAV_VIEW
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
