//
//  ProfileInfoView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-05-28.
//

import SwiftUI

struct ProfileInfoView: View {
    @State var major: String = ""
    @State var school: String = ""
    @State var startDate: String = ""
    @State var intro: String = ""

    var body: some View {
        ZStack {
            Color(red: 0.9490, green: 0.9411, blue: 0.9098)
                .ignoresSafeArea()
            Spacer()
            //Background_2()
            VStack(alignment: .center) {
                VStack(alignment: .center) {
                    Text("Set Profile")
                        .font(Font.custom("Charm-Regular", size: 60))
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 15) {
                    InputNoIconView(
                        value: $major,
                        placeholder:"Major"
                    )
                    InputNoIconView(
                        value: $school,
                        placeholder:"School Name"
                    )
                    InputNoIconView(
                        value: $startDate,
                        placeholder:"Start Date"
                    )
                    VStack(alignment: .leading) {
                        TextEditor(text: $intro)
                            .frame(width: 348)
                            .padding(15)
                        // reference:  https://stackoverflow.com/questions/60374653/swiftui-textfield-height-didnt-change
                    }.frame(height: 180)
                        .background(Color.white)
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(red: 0.9, green: 0.9, blue: 0.9)))
                        .shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0)
                }.frame(height: 500)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                VStack(alignment: .leading) {
                    ButtonView_2(action: {},
                         label: "Next",
                         color: Color(
                            red: 0.8627,
                            green: 0.8470,
                             blue: 0.7960
                         )
                    ).padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                }
            }.frame(height: 700)
                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

struct ProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView()
    }
}
