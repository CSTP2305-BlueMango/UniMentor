//
//  PopUpView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-22.
//

import SwiftUI

/// guard popup view component
/// param: show state, information, button action, button text
///       optional: warning message
struct PopUpView: View {
    /// popup show state
    @Binding var show: Bool
    /// popup message
    var information: String
    /// warning message (optional)
    var warnMessage: String?
    /// button action
    var buttonAction: ()->Void
    /// button lable
    var buttonText: String
    /// hide left button
    var hideCancelButton = false
    /// left button color
    var leftButtonColor = Color("ButtonColor")
    /// right button color
    var rightButtonColor = Color("UnmatchColor")
    
    var body: some View {
        ZStack {
            // IF SHOW
            if show {
                // Background
                Color.black.opacity(show ? 0.3 : 0).edgesIgnoringSafeArea(.all)
                // Popup
                VStack(spacing: UIScreen.main.bounds.height * 0.03) {
                    // Messsages
                    VStack(spacing: UIScreen.main.bounds.height * 0.01) {
                        // Popup message
                        Text(information)
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.06))
                            .multilineTextAlignment(.center)
                        // Warning message
                        if let warnMessage = warnMessage {
                            Text(warnMessage)
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                                .foregroundColor(.red)
                        }
                    }
                    // Buttons
                    HStack(spacing: UIScreen.main.bounds.width * 0.07) {
                        if !hideCancelButton {
                            // Cancel popup button
                            Button(action: {show = false})
                            {
                                Text("Cancel")
                                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                                    .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.width * 0.12)
                                    .background(leftButtonColor.cornerRadius(UIScreen.main.bounds.width * 0.1).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                                    .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                            }.buttonStyle(.plain)
                        }
                        // Button
                        Button(action: buttonAction) {
                            Text(buttonText)
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                                .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.width * 0.12)
                                .background(rightButtonColor.cornerRadius(UIScreen.main.bounds.width * 0.1).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                                .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                        }.buttonStyle(.plain)
                    }//: Buttons
                }
                .frame(width: UIScreen.main.bounds.width * 0.7)
                .padding(UIScreen.main.bounds.width * 0.07)
                .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.04).fill(Color.white))
                //: Popup
            }//: IF SHOW
        }//: ZSTACK
    }
}

struct popupPreviewView: View {
    @State var show: Bool = true
    var body: some View {
        PopUpView(
            show: $show,
            information: "",
            warnMessage: "",
            buttonAction: {},
            buttonText: ""
        )
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        popupPreviewView()
    }
}
