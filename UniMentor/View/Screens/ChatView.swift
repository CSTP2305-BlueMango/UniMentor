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
                HStack {
                    Text("Messages")
                        .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.12))
                    Spacer()
                    VStack {
                        Spacer()
                        Button(action: {}) {
                            Text("Edit")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                                .foregroundColor(Color.black)
                        }
                    }
                } //: HEADER
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.05)
                Spacer()
                // MAIN
                VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                    // Card list
                    // TODO: make it scrollable
                    VStack(spacing: UIScreen.main.bounds.height * 0.02) {
                        // TODO: this is gonna be For loop
                        NavigationLink(destination: MessageChatView()) {
                            CardView()
                        }
                        NavigationLink(destination: MessageChatView()) {
                            CardView()
                        }
                        NavigationLink(destination: MessageChatView()) {
                            CardView()
                        }
                        NavigationLink(destination: MessageChatView()) {
                            CardView()
                        }
                    }
                    Spacer()
                } //: MAIN
            } //: BODY
            .frame(height: UIScreen.main.bounds.height * 0.95)
            Spacer()
        } //: NAV_VIEW
        // Text("This is the CHAT VIEW")
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
