//
//  InfoPopupView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-22.
//

import SwiftUI

// reference: https://johncodeos.com/how-to-create-a-popup-window-with-swiftui/
struct InfoPopupView: View {
    @Binding var show: Bool
    @State var infoList: [String] = [
        "This is test one",
        "Test line two with longer paragraph for giving information to the users",
        "Hello world",
        "Hello world"
    ]
    
    var body: some View {
        ZStack {
            if show {
                Color.black.opacity(show ? 0.3 : 0).edgesIgnoringSafeArea(.all)
                
                ZStack(alignment: .top) {
                    VStack(spacing: UIScreen.main.bounds.height * 0.04) {
                        Text("Information")
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.07))
                        VStack(spacing: UIScreen.main.bounds.height * 0.01) {
                            ForEach(infoList, id: \.self) { info in
                                HStack(alignment: .top) {
                                    HStack {
                                        Image(systemName: "circle.fill")
                                            .font(.system(size: UIScreen.main.bounds.width * 0.015))
                                    }.padding(.top, UIScreen.main.bounds.width * 0.017)
                                    VStack {
                                        Text("\(info)").font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                                    }
                                    Spacer()
                                }
                            }
                        }.padding(.bottom, UIScreen.main.bounds.height * 0.01)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.7)
                    .padding(UIScreen.main.bounds.width * 0.07)
                    .background(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width * 0.04).fill(Color.white))
                    ZStack {
                        Button(action: {
                        show = false
                        }) {
                            Image(systemName: "xmark.circle")
                                .font(.system(size: UIScreen.main.bounds.width * 0.06))
                                .foregroundColor(.black)
                        }
                    }.padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.01, leading: UIScreen.main.bounds.width * 0.73, bottom: 0, trailing: 0))
                }
            }
        }
    }
}

struct infoPopupPreviewView: View {
    @State var show: Bool = true
    var body: some View {
        InfoPopupView(
            show: $show
        )
    }
}

struct InfoPopupView_Previews: PreviewProvider {
    static var previews: some View {
        infoPopupPreviewView()
    }
}
