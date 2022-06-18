//
//  ChatView.swift
//  UniMentor
//
//  Created by Mary Nicolette Tan on 2022-06-03.
//

import SwiftUI

struct ChatView: View {
    @State var isEditClicked: Bool = false
    
    var body: some View {
        NavigationView {
            // BODY
            VStack(spacing: UIScreen.main.bounds.height * 0.04)  {
                // HEADER
                VStack {
                    Spacer()
                    HStack {
                        Text("Messages")
                            .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.12))
                        Spacer()
                        EditButtonView(title: "Edit", action: {
                            isEditClicked = !isEditClicked
                        })
                    }.frame(width: UIScreen.main.bounds.width * 0.9)
                } //: HEADER
                .frame(height: UIScreen.main.bounds.height * 0.02)
                // Spacer().frame(height: UIScreen.main.bounds.height * 0.016)
                // MAIN
                VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                    ScrollView {
                        VStack(spacing: UIScreen.main.bounds.height * 0.015) {
                            ForEach(0..<10, id: \.self) { num in
                                NavigationLink(destination: MessageChatView()) {
                                    MessageCardView()
                                }
                            }
                            // TODO: info when there is no card to display
                        }
                        .padding(UIScreen.main.bounds.width * 0.02)
                        //this will compress everything into center, adding padding horizontally
                        .padding(.horizontal)
                    } //: Scrollview
                } //: MAIN
            } //: BODY
            .padding(.top, UIScreen.main.bounds.width * 0.02)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        } //: NAV_VIEW
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
