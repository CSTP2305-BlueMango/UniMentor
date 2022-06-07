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
    
    //state for keeping track of if NavigationLink for profilepic view is active
    @State var isProfilePicActive = false
    
    var body: some View {
        ZStack {
            //NAVIGATIONLINK
            NavigationLink(
                destination: ProfilePictureView(),
                isActive: $isProfilePicActive) {
                    EmptyView()
                }
            //:NAVIGATIONLINK
            Color(red: 0.7803, green: 0.7176, blue: 0.6196)
                .ignoresSafeArea()
            
            //NAVIGATIONLINK
            NavigationLink(
                destination: ProfilePictureView(),
                isActive: $isProfilePicActive) {
                    EmptyView()
                }
            //:NAVIGATIONLINK
            
            // BODY
            VStack(alignment: .center) {
                // HEADER
                VStack(alignment: .center) {
                    Text("Set Profile")
                        .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.15))
                } //: HEADER
                Spacer()
                // MAIN
                VStack(spacing: UIScreen.main.bounds.width * 0.035) {
                    // INPUT FIELDS
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
                    // MULTILINE INPUT FIELDS
                    VStack(alignment: .leading) {
                        TextEditor(text: $intro)
                            .padding(EdgeInsets(top: UIScreen.main.bounds.width * 0.03, leading: UIScreen.main.bounds.width * 0.05, bottom: UIScreen.main.bounds.width * 0.03, trailing: UIScreen.main.bounds.width * 0.05))
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045))
                        // reference:  https://stackoverflow.com/questions/60374653/swiftui-textfield-height-didnt-change
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.21)
                    .background(Color.white)
                    .cornerRadius(UIScreen.main.bounds.width * 0.04)
                    .shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0)
                } //: MAIN
                .frame(height: UIScreen.main.bounds.height * 0.47)
                Spacer()
                Spacer()
                // FOOTER
                VStack() {
                    ButtonView_2(action: {
                        self.isProfilePicActive = true
                    },
                         label: "Next",
                         color: Color(red:0.6235, green: 0.5450, blue: 0.4235),
                         opacity: 1.0,
                         isBorder: false
                    )
                } //: FOOTER
            } //: BODY
            .frame(height: UIScreen.main.bounds.height * 0.85)
        } .navigationBarHidden(true)
         .navigationBarBackButtonHidden(true) //: ZSTACK
    }
}

struct ProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView()
    }
}