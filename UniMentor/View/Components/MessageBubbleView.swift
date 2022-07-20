//
//  MessageBubbleView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-19.
//

import SwiftUI

// reference: https://www.youtube.com/watch?v=Zz9XQy8PRpQ
struct MessageBubbleView: View {
    @State var message = ""
    @State var time = ""
    @State var date = "test"
    @State var showDate = false
    @State var isUserMessage = false
    var body: some View {
        if isUserMessage {
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Text(time)
                            .foregroundColor(Color("DarkColor"))
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                            .padding(0)
                    }.frame(height: UIScreen.main.bounds.height * 0.04)
                    HStack {
                        Text(message)
                            .foregroundColor(.black)
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                    }
                    .padding(EdgeInsets(top: UIScreen.main.bounds.width * 0.03, leading: UIScreen.main.bounds.width * 0.05, bottom: UIScreen.main.bounds.width * 0.03, trailing: UIScreen.main.bounds.width * 0.05))
                    .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.05).fill(Color.white).shadow(color: Color(.gray).opacity(0.3), radius: 5, x: 0, y: 0))
                    
                }
                .padding(.horizontal)
                .onTapGesture {
                    showDate.toggle()
                }
                if showDate {
                    HStack {
                        Spacer()
                        Text(date)
                            .foregroundColor(Color("DarkColor"))
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                    }
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                }
            } //: VSTACK
        } else {
            VStack {
                HStack {
                    HStack {
                        Text(message)
                            .foregroundColor(.black)
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                    }
                    .padding(EdgeInsets(top: UIScreen.main.bounds.width * 0.03, leading: UIScreen.main.bounds.width * 0.05, bottom: UIScreen.main.bounds.width * 0.03, trailing: UIScreen.main.bounds.width * 0.05))
                    .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.05).fill(Color.white).shadow(color: Color(.gray).opacity(0.3), radius: 5, x: 0, y: 0))
                    VStack {
                        Spacer()
                        Text(time)
                            .foregroundColor(Color("DarkColor"))
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                            .padding(0)
                    }.frame(height: UIScreen.main.bounds.height * 0.04)
                    Spacer()
                }
                .padding(.horizontal)
                .onTapGesture {
                    showDate.toggle()
                }
                if showDate {
                    HStack {
                        Text(date)
                            .foregroundColor(Color("DarkColor"))
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                        Spacer()
                    }
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
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
