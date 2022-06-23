//
//  PopUpView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-22.
//

import SwiftUI

struct PopUpView: View {
    @Binding var show: Bool
    var information: String
    var warmMessage: String?
    var buttonAction: ()->Void
    var buttonText: String
    
    var body: some View {
        ZStack {
            if show {
                Color.black.opacity(show ? 0.3 : 0).edgesIgnoringSafeArea(.all)
                VStack(spacing: UIScreen.main.bounds.height * 0.03) {
                    VStack(spacing: UIScreen.main.bounds.height * 0.01) {
                        Text("\(information)")
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.06))
                            .multilineTextAlignment(.center)
                        if let warmMessage = warmMessage {
                            Text("\(warmMessage)")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                                .foregroundColor(.red)
                        }
                    }
                    HStack(spacing: UIScreen.main.bounds.width * 0.07) {
                        Button(action: {
                            show = false
                        }) {
                            Text("Cancel")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                                .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.width * 0.12)
                                .background(Color("ButtonColor").cornerRadius(UIScreen.main.bounds.width * 0.1).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                                .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                        }
                        .buttonStyle(.plain)
                        Button(action: buttonAction) {
                            Text("\(buttonText)")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                                .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.width * 0.12)
                                .background(Color("UnmatchColor").cornerRadius(UIScreen.main.bounds.width * 0.1).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                                .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                        }
                        .buttonStyle(.plain)
                    }
                }.frame(width: UIScreen.main.bounds.width * 0.7)
                    .padding(UIScreen.main.bounds.width * 0.07)
                    .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.04).fill(Color.white))
            }
        }

    }
}

struct popupPreviewView: View {
    @State var show: Bool = true
    var body: some View {
        PopUpView(
            show: $show,
            information: "Unmatch with First Lastname?",
            warmMessage: "* Unmatching will delete messages",
            buttonAction: {},
            buttonText: "Unmatch"
        )
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        popupPreviewView()
    }
}
