//
//  ErrorPopupView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-22.
//

import SwiftUI

struct ErrorPopupView: View {
    @Binding var show: Bool
    @State var errorMessage = "this is error message"
    
    var body: some View {
        ZStack {
            // Log out after delete account
            if show {
                // background
                Color.black.opacity(show ? 0.3 : 0).edgesIgnoringSafeArea(.all)
                // Popup
                VStack(spacing: UIScreen.main.bounds.height * 0.03) {
                    VStack(spacing: UIScreen.main.bounds.height * 0.01) {
                        // popup message
                        Text(errorMessage)
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.06))
                            .multilineTextAlignment(.center)
                    }
                    HStack(spacing: UIScreen.main.bounds.width * 0.07) {
                        // button
                        Button(action: {
                            // appVM.signOut()
                        }) {
                            Text("Okay")
                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                                .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.width * 0.12)
                                .background(Color("UnmatchColor").cornerRadius(UIScreen.main.bounds.width * 0.1).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                                .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.7)
                .padding(UIScreen.main.bounds.width * 0.07)
                .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.04).fill(Color.white))
                //: Popup
            }//: IF SHOW

        }
    }
}

struct ErrorPopupViewPreviewView: View {
    @State var show: Bool = true
    var body: some View {
        ErrorPopupView(
            show: $show
        )
    }
}

struct ErrorPopupView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorPopupViewPreviewView()
    }
}
