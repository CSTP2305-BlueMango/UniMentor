//
//  MatchedView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

/// matched view
struct MatchedView: View {
    /// if pop up showing
    @State private var showPopUp: Bool = false
    /// if edit button clicked
    @State var isEditClicked: Bool = false
    /// edit button text
    @State var editButtonTitle: String = "Edit"
    
    var body: some View {
        ZStack {
            // BODY
            VStack(spacing: 0) {
                VStack(spacing: UIScreen.main.bounds.height * 0.04)  {
                    // HEADER
                    VStack {
                        Spacer()
                        HStack {
                            // TITLE
                            Text("Matched")
                                .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.12))
                            
                            Spacer()
                            // Edit button
                            EditButtonView(title: editButtonTitle, action: {
                                if editButtonTitle == "Edit" {
                                    editButtonTitle = "Finish"
                                } else {
                                    editButtonTitle = "Edit"
                                }
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
                                    NavigationLink(destination: MatchedProfileView()) {
                                        CardView(isEditClicked: isEditClicked)
                                    }
                                }
                                // TODO: info when there is no card to display
                            }
                            .padding(UIScreen.main.bounds.width * 0.02)
                        } //: ScrollView
                    } //: MAIN
                }
                if isEditClicked {
                    VStack {
                        // Unmatch button
                        Button(action: {
                            showPopUp = true
                        }) {
                            Text("Unmatch")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                                .frame(width: UIScreen.main.bounds.width * 1)
                                .padding(UIScreen.main.bounds.width * 0.04)
                                .foregroundColor(.black)
                                .background(Color("ButtonColor"))
                        }
                    }.padding(0)
                }
            }
            .padding(.top, UIScreen.main.bounds.width * 0.02)
            .navigationBar(backButton: true, barHidden: true)
            //: BODY
            // POPUP
            PopUpView(show: $showPopUp, information: "Unmatch with selected people?",
                      warmMessage: "* Unmatching will delete messages", buttonAction: {
                      // TODO: unmatch with selected users
                      },
                      buttonText: "Unmatch")
            //: POPUP
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
