//
//  MatchedPopupView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-04.
//

import SwiftUI

/// matched inform popup view component
struct MatchedPopupView: View {
    /// popup show state
    @Binding var show: Bool
    /// matched user name
    @State var matchedUserName: String
    /// matched user image
    @State var matchedUserImage: String
    /// current user image
    @State var userImage: String = "user_image2"
    /// button action
    @State var action: ()->Void
    
    var body: some View {
        ZStack {
            if show {
                // background
                Color.black.opacity(show ? 0.3 : 0).edgesIgnoringSafeArea(.all)
                // Popup
                VStack {
                    // message
                    Text("Matched with \(matchedUserName)")
                        .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.06))
                        .multilineTextAlignment(.center)
                    // image
                    ZStack {
                        // background image
                        VStack {
                            Image("arrows")
                                .resizable()
                                .cornerRadius(50)
                                .aspectRatio(contentMode: .fill)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.width * 0.5)
                        .clipShape(Circle())
                        .padding(EdgeInsets(top: UIScreen.main.bounds.width * 0.27, leading: UIScreen.main.bounds.width * 0.1, bottom: 0, trailing: 0))
                        // matched user image
                        VStack {
                            Image(matchedUserImage)
                                .resizable()
                                .cornerRadius(50)
                                .background(Color(red: 0.9490, green: 0.9490, blue: 0.9490))
                                .aspectRatio(contentMode: .fill)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.width * 0.5)
                        .clipShape(Circle())
                        .shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0)
                        .padding(EdgeInsets(top: 0, leading: -UIScreen.main.bounds.width * 0.23, bottom: 0, trailing: 0))
                        // user image
                        VStack {
                            Image(userImage)
                                .resizable()
                                .cornerRadius(50)
                                .background(Color(red: 0.9490, green: 0.9490, blue: 0.9490))
                                .aspectRatio(contentMode: .fill)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.width * 0.35)
                        .clipShape(Circle())
                        .shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0)
                        .padding(EdgeInsets(top: UIScreen.main.bounds.width * 0.5, leading: UIScreen.main.bounds.width * 0.38, bottom: 0, trailing: 0))
                    }.padding(EdgeInsets(top: -UIScreen.main.bounds.width * 0.1, leading: 0, bottom: UIScreen.main.bounds.width * 0.07, trailing: 0))
                    //: image
                    // button
                    Button(action: action) {
                        Text("OK")
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                            .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.width * 0.12)
                            .background(Color("ButtonColor").cornerRadius(UIScreen.main.bounds.width * 0.04).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0))
                            .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                    }
                    .buttonStyle(.plain)
                }
                .frame(width: UIScreen.main.bounds.width * 0.7)
                .padding(UIScreen.main.bounds.width * 0.07)
                .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.04).fill(Color.white))
                //: Popup
            }//: IF SHOW
        }//: ZSTACK
    }
}

struct MatchedPopupViewPreviewView: View {
    @State var show: Bool = true
    var body: some View {
        MatchedPopupView(
            show: $show,
            matchedUserName: "First Lastname",
            matchedUserImage: "user_image",
            action: {}
        )
    }
}

struct MatchedPopupView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedPopupViewPreviewView()
    }
}
