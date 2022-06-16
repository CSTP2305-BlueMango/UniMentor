//
//  MatchedView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

struct MatchedView: View {
    
    @State var isEditClicked: Bool = false
    
    var body: some View {
        NavigationView {
            // BODY
            VStack(spacing: UIScreen.main.bounds.height * 0.02)  {
                // HEADER
                HStack {
                    Text("Matched")
                        .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.12))
                    Spacer()
                    VStack {
                        // Spacer()
                        // TODO: button not working
                        Button(action: {
                            print("hello")
                            isEditClicked = !isEditClicked
                        }) {
                            if !isEditClicked {
                                Text("Edit")
                                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                                    .foregroundColor(Color.black)
                            } else {
                                Text("Finish")
                                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                                    .foregroundColor(Color.black)
                            }
                        }
                        // EditButtonView(title: "Edit")
                    }
                } //: HEADER
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 0)
                // MAIN
                VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                    Text("")
                    // Card list
                    ScrollView {
                        VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                            // TODO: this is gonna be For loop
                            if !isEditClicked {
                                NavigationLink(destination: MatchedProfileView()) {
                                    CardView()
                                }
                                NavigationLink(destination: MatchedProfileView()) {
                                    CardView()
                                }
                                NavigationLink(destination: MatchedProfileView()) {
                                    CardView()
                                }
                                NavigationLink(destination: MatchedProfileView()) {
                                    CardView()
                                }
                                NavigationLink(destination: MatchedProfileView()) {
                                    CardView()
                                }
                                NavigationLink(destination: MatchedProfileView()) {
                                    CardView()
                                }
                                NavigationLink(destination: MatchedProfileView()) {
                                    CardView()
                                }
                                NavigationLink(destination: MatchedProfileView()) {
                                    CardView()
                                }
                            } else {
                                // TODO: make it to be editable cards
                                ButtonCardView(
                                    color: Color(red: 0.8078, green: 0.4901, blue: 0.4901),
                                    buttonText: "UnMatch"
                                )
                                ButtonCardView(
                                    color: Color(red: 0.8078, green: 0.4901, blue: 0.4901),
                                    buttonText: "UnMatch"
                                )
                                ButtonCardView(
                                    color: Color(red: 0.8078, green: 0.4901, blue: 0.4901),
                                    buttonText: "UnMatch"
                                )
                                ButtonCardView(
                                    color: Color(red: 0.8078, green: 0.4901, blue: 0.4901),
                                    buttonText: "UnMatch"
                                )
                                ButtonCardView(
                                    color: Color(red: 0.8078, green: 0.4901, blue: 0.4901),
                                    buttonText: "UnMatch"
                                )
                                ButtonCardView(
                                    color: Color(red: 0.8078, green: 0.4901, blue: 0.4901),
                                    buttonText: "UnMatch"
                                )
                                ButtonCardView(
                                    color: Color(red: 0.8078, green: 0.4901, blue: 0.4901),
                                    buttonText: "UnMatch"
                                )
                                ButtonCardView(
                                    color: Color(red: 0.8078, green: 0.4901, blue: 0.4901),
                                    buttonText: "UnMatch"
                                )
                            }
                        }
                        .padding(UIScreen.main.bounds.width * 0.02)
                    } //: ScrollView
                    Spacer()
                } //: MAIN
                Spacer()
            } //: BODY
            .frame(height: UIScreen.main.bounds.height * 0.897)
            Spacer()
        } //: NAV_VIEW
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
