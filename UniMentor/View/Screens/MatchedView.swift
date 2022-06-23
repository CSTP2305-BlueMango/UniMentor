//
//  MatchedView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

struct MatchedView: View {
    
    @State var isEditClicked: Bool = false
    @State var isOn1: Bool = true
    
    var body: some View {
        NavigationView {
            // BODY
            VStack(spacing: UIScreen.main.bounds.height * 0.04)  {
                // HEADER
                VStack {
                    Spacer()
                    HStack {
                        Text("Matched")
                            .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.12))
                        
                        Spacer()
                        EditButtonView(title: "Edit", action: {
                            isEditClicked = !isEditClicked
                        })
                        
                    }.frame(width: UIScreen.main.bounds.width * 0.9)
                } //: HEADER
                .frame(height: UIScreen.main.bounds.height * 0.02)
                
                // MAIN
                VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                    // Card list
                    ScrollView {
                        VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                            
                            // var isClicked: Bool = false
                            ForEach(0..<10, id: \.self) { num in
                                if !isEditClicked {
                                    NavigationLink(destination: MatchedProfileView()) {
                                        CardView()
                                    }
                                } else {
                                    Button(action: {
                                        
                                        isOn1 = !isOn1
                                    }) {
                                        HStack {
                                            // reference: https://swiftuirecipes.com/blog/custom-toggle-checkbox-in-swiftui
                                            Toggle("", isOn: $isOn1)
                                              .toggleStyle(CheckboxToggleStyle(style: .circle))
                                              .foregroundColor(.blue)
                                            CardView()
                                        }.frame(width: UIScreen.main.bounds.width * 1).padding(.leading, UIScreen.main.bounds.width * 0.12)
                                    }
                                }
                            }
//                            if !isEditClicked {
//                                NavigationLink(destination: MatchedProfileView()) {
//                                    CardView()
//                                }
//                            } else {
//                                // TODO: make it to be editable cards
//                                ButtonCardView(
//                                    color: Color(red: 0.8078, green: 0.4901, blue: 0.4901),
//                                    buttonText: "UnMatch"
//                                )
//                            }
                            // TODO: info when there is no card to display
                        }
                        .padding(UIScreen.main.bounds.width * 0.02)
                    } //: ScrollView
                } //: MAIN
            } //: BODY
            .padding(.top, UIScreen.main.bounds.width * 0.02)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        } //: NAV_VIEW
        // .navigationBarHidden(true)
        
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
