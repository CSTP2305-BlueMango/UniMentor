//
//  ProfileInfoView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-05-28.
//
import SwiftUI

/// set user profile information
/// param: user name
struct ProfileInfoView: View {
    init(name: String) {
        // initialize image view model object
        self.imageVM = ImageViewModel()
        // set user name passed from signup view
        self.name = name
    }
    
    /// user name
    @State var name: String
    /// for selecting an image
    @State private var image = UIImage()
    /// to view the photo library and user to choose a photo
    @State private var showSheet = false
    /// image error message
    @State private var imageError = ""
    /// if profile information is finished
    @State var isProfileConfirmActive = false
    /// image view model object
    @ObservedObject private var imageVM: ImageViewModel
    /// profile view model object
    @StateObject var profileVM: ProfileViewModel = ProfileViewModel()
    
    /// upload image to firebase storage
    private func handleImage() {
        imageVM.persistImageToStorage(image: self.image)
    }
    
    // load name to view model on view load
    func onViewLoad() {
        profileVM.profile.name = name
    }
    
    var body: some View {
        // ZSTACK
        ZStack {
            // BACKGROUND
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            // NAVIGATIONLINK - navigate to profile confirm view with user inputs
            NavigationLink(
                destination: ProfileConfirmView(
                    name: profileVM.profile.name,
                    image: image,
                    major: profileVM.profile.major,
                    school: profileVM.profile.school,
                    startDate: "\(profileVM.profile.startDate.month) \(profileVM.profile.startDate.year)",
                    info: profileVM.profile.intro),
                isActive: $isProfileConfirmActive
            ) {EmptyView()}
            
            // SCROLLVIEW
            ScrollView {
                // BODY
                VStack(alignment: .center) {
                    // HEADER
                    VStack(alignment: .center) {
                        // Title
                        Text("Set Profile")
                            .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.15))
                    }.padding(.top, UIScreen.main.bounds.width * 0.06)
                    //: HEADER
                    Spacer()
                    // SELECT IMAGE
                    VStack {
                        // reference: https://designcode.io/swiftui-advanced-handbook-imagepicker
                        // Select image
                        Button {
                            // show image picker
                            showSheet = true
                        } label: {
                            ZStack {
                                // reference: https://www.youtube.com/watch?v=MJuMIpdpORk
                                // User image
                                VStack {
                                    if let image = self.image {
                                        // if image is selected
                                        Image(uiImage: image)
                                             .resizable()
                                             .cornerRadius(50)
                                             .background(Color(red: 0.9490, green: 0.9490, blue: 0.9490))
                                             .aspectRatio(contentMode: .fill)
                                             .clipShape(Circle())
                                    } else {
                                        // if image is not selected
                                        Image("")
                                             .resizable()
                                             .cornerRadius(50)
                                             .background(Color(red: 0.9490, green: 0.9490, blue: 0.9490))
                                             .aspectRatio(contentMode: .fill)
                                             .clipShape(Circle())
                                    }
                                }.frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.45)
                                // Image input icon
                                HStack {
                                    Image(systemName: "plus")
                                        .foregroundColor(Color.white)
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
                        // shows the photo library
                        .sheet(isPresented: $showSheet) {
                            // Pick an image from the photo library
                            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                        }
                        HStack {
                            if let errorMessage = imageError {
                                Text(errorMessage).font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04)).foregroundColor(Color("ErrorColor")).frame(width: UIScreen.main.bounds.width * 0.52)
                            }
                        }
                    } //: SELECT IMAGE
                    // INPUT FIELDS
                    VStack(spacing: UIScreen.main.bounds.width * 0.015) {
                        // Major input
                        InputFieldView(
                            value: $profileVM.profile.major,
                            placeholder:"Computer Systems Technology",
                            icon: "book.fill",
                            title: "Major",
                            errorMessage: $profileVM.majorError
                        )
                        // School input
                        InputFieldView(
                            value: $profileVM.profile.school,
                            placeholder:"Vancouver Community College",
                            icon: "house.fill",
                            title: "School Name",
                            errorMessage: $profileVM.schoolError
                        )
                        // Startdate input
                        DatePickerView(
                            placholder: "Start Date",
                            month: $profileVM.profile.startDate.month,
                            year: $profileVM.profile.startDate.year,
                            errorMessage: $profileVM.startDateError)
                        // Information input
                        MultiLineInputView(
                            value: $profileVM.profile.intro,
                            errorMessage: $profileVM.introError)
                    }.frame(height: UIScreen.main.bounds.height * 0.6)
                    //: INPUT FIELDS
                    Spacer()
                    Spacer()
                    // FOOTER
                    VStack() {
                        // Next button - go to profile confirm view
                        ButtonView(action: {
                            imageError = ""
                            if self.image.size.width == 0 {
                                imageError = "select image"
                            }
                            else {
                                // validate user input and go to profile confirm view
                                profileVM.handleSubmit { _ in
                                    Task {
                                        // save image to database
                                        handleImage()
                                    }
                                }
                                if imageVM.isImageFinished {
                                    isProfileConfirmActive = true
                                }
                            }
                        },
                             label: "Next",
                             color: Color("TabBarColor")
                        )
                    } //: FOOTER
                }.frame(height: UIScreen.main.bounds.height * 1.1)
                //: BODY
            } //: ScrollView
        }
        .hideNavigationBar()
        .onAppear {
            onViewLoad()
        }
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


