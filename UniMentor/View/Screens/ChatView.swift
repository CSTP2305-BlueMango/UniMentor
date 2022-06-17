//
//  ChatView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        NavigationView {
            // BODY
            VStack(spacing: UIScreen.main.bounds.height * 0.02)  {
                // HEADER
                VStack {
                    Spacer()
                    HStack {
                        Text("Messages")
                            .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.12))
                        Spacer()
                        VStack {
                            Spacer()
                            // TODO: button not working
    //                        Button(action: {
    //                            print("hello")
    //                            self.isEditClicked = !self.isEditClicked
    //                        }) {
    //                            if !isEditClicked {
    //                                Text("Edit")
    //                                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
    //                                    .foregroundColor(Color.black)
    //                            } else {
    //                                Text("Finish")
    //                                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
    //                                    .foregroundColor(Color.black)
    //                            }
    //                        }
                            
                            EditButtonView(title: "Edit")
                        }
                    }.frame(width: UIScreen.main.bounds.width * 0.9)
                } //: HEADER
                .frame(height: UIScreen.main.bounds.height * 0.02)
                Spacer().frame(height: UIScreen.main.bounds.height * 0.016)
                // MAIN
                VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                    ScrollView {
                        VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                            ForEach(0..<10, id: \.self) { num in
                                CardView()
                            }
                        }
                        .padding(UIScreen.main.bounds.width * 0.02)
                        //this will compress everything into center, adding padding horizontally
                        .padding(.horizontal)
                    } //: Scrollview
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

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
