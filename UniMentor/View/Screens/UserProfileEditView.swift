//
//  UserProfileEditView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-22.
//

import SwiftUI

/// edit user profile information
struct UserProfileEditView: View {
    /// user major
    @State var major: String = ""
    /// user school
    @State var school: String = ""
    /// user start date
    @State var startDate: Date = Date.now
    /// user information
    @State var info: String = ""
    
    /// for selecting an image
    @State private var image = UIImage()
    /// to view the photo library and user to choose a photo
    @State private var showSheet = false
    
    var body: some View {
        ZStack {
            // ScrollView
            ScrollView {
                // BODY
                VStack(alignment: .center, spacing: UIScreen.main.bounds.height * 0.07) {
                    // HEADER
                    VStack {
                        HStack {
                            Text("Edit Profile")
                                .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.12))
                            Spacer()
                        }.frame(width: UIScreen.main.bounds.width * 0.9)
                    } //: HEADER
                    .frame(height: UIScreen.main.bounds.height * 0.02)
                    
                    // MAIN
                    VStack(spacing: UIScreen.main.bounds.width * 0.015) {
                        // SELECT IMAGE
                        VStack {
                            // reference: https://designcode.io/swiftui-advanced-handbook-imagepicker for selecting image
                            Button {
                                    //when "+" button is clicked, will go to photo library
                                showSheet = true
                            } label: {
                                ZStack {
                                    // reference: https://www.youtube.com/watch?v=MJuMIpdpORk for clipShape(Circle())
                                    Image(uiImage: self.image)
                                         .resizable()
                                         .cornerRadius(50)
                                         .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.45)
                                         .background(Color(red: 0.9490, green: 0.9490, blue: 0.9490))
                                         .aspectRatio(contentMode: .fill)
                                         .clipShape(Circle())
                                    HStack {
                                        Image(systemName: "plus")
                                            .foregroundColor(
                                                Color.white)
                                            .font(.system(size: UIScreen.main.bounds.width * 0.07))
                                        
                                    }
                                    //customize button style here
                                    .frame(width: UIScreen.main.bounds.width * 0.12, height: UIScreen.main.bounds.width * 0.12)
                                    //CHANGE COLOR to the theme
                                    .background(Color("ButtonColor"))
                                    .cornerRadius(30)
                                    .padding(EdgeInsets(top: UIScreen.main.bounds.width * 0.3, leading: UIScreen.main.bounds.width * 0.33, bottom: 0, trailing: 0))
                                }
                            }
                                //need to modify placement of the "+" to make it fixed
                            
                                //this is for when user clicks the button, shows the photo library
                            .sheet(isPresented: $showSheet) {
                                        // Pick an image from the photo library:
                                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                            }
                        } // SELECT IMAGE
                        // INPUT FIELDS
                        // major input
                        InputFieldView(
                            value: $major,
                            placeholder:"Computer Systems Technology",
                            icon: "book.fill",
                            title: "Major",
                            errorMessage: Binding.constant(nil)
                        )
                        // school input
                        InputFieldView(
                            value: $school,
                            placeholder:"Vancouver Community College",
                            icon: "house.fill",
                            title: "School Name",
                            errorMessage: Binding.constant(nil)
                        )
                        // date input
                        DatePickerView(placholder: "Start Date", date: $startDate)
                        // information input
                        // MULTILINE INPUT FIELDS
                        // reference: https://stackoverflow.com/questions/62741851/how-to-add-placeholder-text-to-texteditor-in-swiftui
                        VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.02)  {
                            HStack {
                                // input title
                                VStack(alignment: .leading) {
                                    Text("Information")
                                        .font(Font.custom( "TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                                        .padding(.leading, UIScreen.main.bounds.width * 0.03)
                                        .foregroundColor(Color("DarkColor"))
                                }.frame(width: UIScreen.main.bounds.width * 0.34, height: UIScreen.main.bounds.height * 0.02, alignment: .leading)
                                Spacer()
                                // error message
                                VStack(alignment: .trailing) {
                                    Text("").font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04)).foregroundColor(Color("ErrorColor")).frame(width: UIScreen.main.bounds.width * 0.52, alignment: .trailing)
                                }.frame(height: UIScreen.main.bounds.height * 0.015).padding(.trailing, UIScreen.main.bounds.width * 0.02)
                            }
                            // input field
                            VStack(alignment: .leading) {
                                HStack(alignment: .center) {
                                TextEditor(text: $info)
                                    .padding(EdgeInsets(top: UIScreen.main.bounds.width * 0.03, leading: UIScreen.main.bounds.width * 0.05, bottom: UIScreen.main.bounds.width * 0.03, trailing: UIScreen.main.bounds.width * 0.05))
                                    .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.045))
                                // reference:  https://stackoverflow.com/questions/60374653/swiftui-textfield-height-didnt-change
                                }
                                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.21)
                                .background(Color.white)
                                .cornerRadius(UIScreen.main.bounds.width * 0.04)
                                .shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        
                    } //: MAIN
                    .frame(height: UIScreen.main.bounds.height * 0.78)
                    // FOOTER
                    VStack() {
                        // Save button
                        ButtonView_2(action: {
                        },
                             label: "Save Changes",
                             color: Color("ButtonColor"),
                             opacity: 1.0,
                             isBorder: false
                        )
                    }
                    .padding(.bottom, UIScreen.main.bounds.height * 0.02)
                    //: FOOTER
                } //: BODY
                .frame(height: UIScreen.main.bounds.height * 1)
            } //: ScrollView
        }
        .padding(.top, -UIScreen.main.bounds.height * 0.03)
        //: ZSTACK
    }
}

struct UserProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileEditView()
    }
}
