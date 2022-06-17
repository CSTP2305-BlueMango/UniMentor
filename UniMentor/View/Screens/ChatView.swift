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
//                        Button(action: {}) {
//                            Text("Edit")
//                                .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
//                                .foregroundColor(Color.black)
//                        }
                    }
                } //: HEADER
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.05)
                Spacer()
                // MAIN
                VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                    ScrollView {
                        ForEach(0..<10, id: \.self) { num in
                            VStack(spacing: UIScreen.main.bounds.height * 0.02) {
                                HStack(spacing: 16) {
                                    //user image
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 32))
                                        .padding()
                                        .overlay(RoundedRectangle(cornerRadius: 44)
                                            .stroke(Color.black, lineWidth: 1))
                                    
                                    //username, text
                                    VStack(alignment: .leading) {
                                        Text("Username")
                                            .font(.system(size: 25, weight: .bold))
                                        Text("Message sent to user")
                                            .font(.system(size: 16))
                                            .foregroundColor(Color(.lightGray))
                                    }
                                    Spacer()
                                    
                                    //time stamp
                                    Text("22d")
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                } // end of HStack
                            } // end of VStack
                            
                            Divider()
                                //this will add padding to each of the card
                                .padding(.vertical, 8)
                        }
                        //this will compress everything into center, adding padding horizontally
                        .padding(.horizontal)
                    }// end of Scrollview
                    
                    Spacer()
                } //: MAIN
            } //: BODY
            .frame(height: UIScreen.main.bounds.height * 0.85)
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
