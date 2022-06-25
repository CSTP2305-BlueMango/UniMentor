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
    @State var startDate: Date = Date.now
    @State var intro: String = ""
    
    
    //for selecting an image
    @State private var image = UIImage()
    //to view the photo library and user to choose a photo
    @State private var showSheet = false
    
    @State var isProfileConfirmActive = false
    
    // ========== plus.square.dashed, photo
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            //NAVIGATIONLINK
            NavigationLink(
                destination: ProfileConfirmView(name: "Test name", major: major, school: school, startDate: "September 2020", info: info),
                isActive: $isProfileConfirmActive
            ) {
                EmptyView()
            }
            //:NAVIGATIONLINK
            
            // ScrollView
            ScrollView {
                // BODY
                VStack(alignment: .center) {
                    // HEADER
                    VStack(alignment: .center) {
                        Text("Set Profile")
                            .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.15))
                    } //: HEADER
                    .padding(.top, UIScreen.main.bounds.width * 0.06)
                    Spacer()
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
                                .background(Color(red:0.6235, green: 0.5450, blue: 0.4235))
                                .cornerRadius(30)
                                .padding(EdgeInsets(top: UIScreen.main.bounds.width * 0.3, leading: UIScreen.main.bounds.width * 0.33, bottom: 0, trailing: 0))
                            }
                        }
                            //need to modify placement of the "+" to make it fixed
                        
                            //this is for when user clicks the button, shows the photo library
                        .sheet(isPresented: $showSheet) {
                                    // Pick an image from the photo library:
                            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                                    //  If you wish to take a photo from camera instead:
                                //ImagePicker(sourceType: .camera, selectedImage: self.$image)
                        }
                    } // SELECT IMAGE
                    // MAIN
                    VStack(spacing: UIScreen.main.bounds.width * 0.015) {
                        // INPUT FIELDS
                        InputFieldView(
                            value: $major,
                            placeholder:"Computer Systems Technology",
                            icon: "book.fill",
                            title: "Major",
                            errorMessage: Binding.constant(nil)
                        )
                        InputFieldView(
                            value: $school,
                            placeholder:"Vancouver Community College",
                            icon: "house.fill",
                            title: "School Name",
                            errorMessage: Binding.constant(nil)
                        )
                        DatePickerView(placholder: "Start Date", date: $startDate)
                        // MULTILINE INPUT FIELDS
                        // reference: https://stackoverflow.com/questions/62741851/how-to-add-placeholder-text-to-texteditor-in-swiftui
                        VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.01)  {
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
                            VStack(alignment: .leading) {
                                HStack(alignment: .center) {
                                TextEditor(text: $intro)
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
                    .frame(height: UIScreen.main.bounds.height * 0.6)
                    Spacer()
                    Spacer()
                    // FOOTER
                    VStack() {
                        ButtonView_2(action: {
                            isProfileConfirmActive = true
                        },
                             label: "Next",
                             color: Color("TabBarColor"),
                             opacity: 1.0,
                             isBorder: false
                        )
                    } //: FOOTER
                } //: BODY
                .frame(height: UIScreen.main.bounds.height * 1.1)
            } //: ScrollView
        } .navigationBarHidden(true)
         .navigationBarBackButtonHidden(true) //: ZSTACK
    }
}

struct ProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView()
    }
}
