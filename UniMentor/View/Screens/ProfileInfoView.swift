//
//  ProfileInfoView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-05-28.
//
import SwiftUI

/// set user profile information
struct ProfileInfoView: View {
    /// profile name
    @State var name: String
    /// prorile major
    @State var major: String = ""
    /// profile school
    @State var school: String = ""
    /// profile start date
    @State var month: String = ""
    @State var year: String = ""
    /// profile information
    @State var info: String = ""
    
    /// profile major error message
    @State var majorError: String? = ""
    /// profile school error message
    @State var schoolError: String? = ""
    /// profile start date error message
    @State var startDateError: String? = ""
    /// profile information error message
    @State var infoError: String? = ""
    
    
    /// for selecting an image
    @State private var image = UIImage()
    /// to view the photo library and user to choose a photo
    @State private var showSheet = false
    /// if profile information is finished
    @State var isProfileConfirmActive = false
    
    var body: some View {
        // ZSTACK
        ZStack {
            // BACKGROUND
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            //NAVIGATIONLINK
            NavigationLink(
                destination: ProfileConfirmView(
                    name: name,
                    major: major,
                    school: school,
                    startDate: "\(month) \(year)",
                    info: info),
                isActive: $isProfileConfirmActive
            ) {EmptyView()}
            //:NAVIGATIONLINK
            
            // SCROLLVIEW
            ScrollView {
                // BODY
                VStack(alignment: .center) {
                    // HEADER
                    VStack(alignment: .center) {
                        Text("Set Profile")
                            .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.15))
                    }
                    .padding(.top, UIScreen.main.bounds.width * 0.06)
                    //: HEADER
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
                    } //: SELECT IMAGE
                    // MAIN
                    VStack(spacing: UIScreen.main.bounds.width * 0.015) {
                        // INPUT FIELDS
                        // MAJOR INPUT
                        InputFieldView(
                            value: $major,
                            placeholder:"Computer Systems Technology",
                            icon: "book.fill",
                            title: "Major",
                            errorMessage: $majorError
                        )
                        // SCHOOL INPUT
                        InputFieldView(
                            value: $school,
                            placeholder:"Vancouver Community College",
                            icon: "house.fill",
                            title: "School Name",
                            errorMessage: $schoolError
                        )
                        // START DATE INPUT
                        DatePickerView(placholder: "Start Date", month: $month, year: $year)
                        // INFORMATION INPUT
                        // MULTILINE INPUT FIELDS
                        // reference: https://stackoverflow.com/questions/62741851/how-to-add-placeholder-text-to-texteditor-in-swiftui
                        VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.02)  {
                            HStack {
                                // INPUT TITLE
                                VStack(alignment: .leading) {
                                    Text("Information")
                                        .font(Font.custom( "TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                                        .padding(.leading, UIScreen.main.bounds.width * 0.03)
                                        .foregroundColor(Color("DarkColor"))
                                }.frame(width: UIScreen.main.bounds.width * 0.34, height: UIScreen.main.bounds.height * 0.02, alignment: .leading)
                                Spacer()
                                // ERROR MESSAGE
                                VStack(alignment: .trailing) {
                                    Text("").font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04)).foregroundColor(Color("ErrorColor")).frame(width: UIScreen.main.bounds.width * 0.52, alignment: .trailing)
                                }.frame(height: UIScreen.main.bounds.height * 0.015).padding(.trailing, UIScreen.main.bounds.width * 0.02)
                            }
                            // INPUT FIELD
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
                        .padding(.top, UIScreen.main.bounds.height * 0.005)
                        //: INFORMATION INPUT
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.6)
                    //: MAIN
                    Spacer()
                    Spacer()
                    // FOOTER
                    VStack() {
                        // Next button
                        ButtonView_2(action: {
                            // TODO: validation
                            
                            
                            isProfileConfirmActive = true
                        },
                             label: "Next",
                             color: Color("TabBarColor"),
                             opacity: 1.0,
                             isBorder: false
                        )
                    } //: FOOTER
                }
                .frame(height: UIScreen.main.bounds.height * 1.1)
                //: BODY
            } //: ScrollView
        }
        .hideNavigationBar()
        //: ZSTACK
    }
}

struct ProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView(
            name: "test"
        )
    }
}
