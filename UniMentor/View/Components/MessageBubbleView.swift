//
//  MessageBubbleView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-19.
//

import SwiftUI

// reference: https://www.youtube.com/watch?v=Zz9XQy8PRpQ
/// chat message box component
/// param: message, time, date, isUsermessage state
struct MessageBubbleView: View {
    /// chat message
    @State var message = ""
    /// chat time
    @State var time = ""
    /// chat date
    @State var date = ""
    /// sent or other recieved state
    @State var isUserMessage = false
    /// show date state
    @State var showDate = false
    var body: some View {
        // if message sent
        if isUserMessage {
            VStack {
                // Message box
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        // Chat time
                        Text(time)
                            .foregroundColor(Color("DarkColor"))
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                            .padding(0)
                    }.frame(height: UIScreen.main.bounds.height * 0.04)
                    HStack {
                        // Chat message
                        Text(message)
                            .foregroundColor(.black)
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                    }
                    .padding(EdgeInsets(top: UIScreen.main.bounds.width * 0.03, leading: UIScreen.main.bounds.width * 0.05, bottom: UIScreen.main.bounds.width * 0.03, trailing: UIScreen.main.bounds.width * 0.05))
                    .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.05).fill(Color.white).shadow(color: Color(.gray).opacity(0.3), radius: 5, x: 0, y: 0))
                }
                .padding(.horizontal)
                // on Message box clicked change state of date show
                .onTapGesture {
                    showDate.toggle()
                }
                // if Message box clicked
                if showDate {
                    // Chat date
                    HStack {
                        Spacer()
                        Text(date)
                            .foregroundColor(Color("DarkColor"))
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                    }.padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                }
            } //: VSTACK
        }
        // if message recieved
        else {
            VStack {
                // Message box
                HStack {
                    HStack {
                        // Chat message
                        Text(message)
                            .foregroundColor(.black)
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                    }
                    .padding(EdgeInsets(top: UIScreen.main.bounds.width * 0.03, leading: UIScreen.main.bounds.width * 0.05, bottom: UIScreen.main.bounds.width * 0.03, trailing: UIScreen.main.bounds.width * 0.05))
                    .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.05).fill(Color.white).shadow(color: Color(.gray).opacity(0.3), radius: 5, x: 0, y: 0))
                    VStack {
                        Spacer()
                        // Chat time
                        Text(time)
                            .foregroundColor(Color("DarkColor"))
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                            .padding(0)
                    }.frame(height: UIScreen.main.bounds.height * 0.04)
                    Spacer()
                }
                .padding(.horizontal)
                // on Message box clicked change state of date show
                .onTapGesture {
                    showDate.toggle()
                }
                // if Message box clicked
                if showDate {
                    // Chat date
                    HStack {
                        Text(date)
                            .foregroundColor(Color("DarkColor"))
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                        Spacer()
                    }.padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                }
            } //: VSTACK
        }
    }
}

struct MessageBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubbleView()
    }
}
