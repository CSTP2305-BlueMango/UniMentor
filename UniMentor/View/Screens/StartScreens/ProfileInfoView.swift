//
//  ProfileInfoView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-05-28.
//
import SwiftUI

/// set user profile information
struct ProfileInfoView: View {

    /// for selecting an image
    @State private var image = UIImage()
    
    /// to view the photo library and user to choose a photo
    @State private var showSheet = false
    
    /// if profile information is finished
    @State var isProfileConfirmActive = false
    
    @ObservedObject private var imageVM: ImageViewModel;
    @ObservedObject var profileVM: ProfileViewModel;
    
    private func handleImage() {
        imageVM.persistImageToStorage(image: self.image)
    }
    
    init(name: String) {
        self.imageVM = ImageViewModel()
        self.profileVM = ProfileViewModel(name: name)
        // imageUrl = ImageViewModel.imageUrl
    }
    
    var body: some View {
        // ZSTACK
        ZStack {
            // BACKGROUND
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            //NAVIGATIONLINK
            NavigationLink(
                destination: ProfileConfirmView(
                    name: profileVM.profile.name,
                    // TODO: fix later
                    image: image,
                    major: profileVM.profile.major,
                    school: profileVM.profile.school,
                    startDate: "\(profileVM.profile.startDate.month) \(profileVM.profile.startDate.year)",
                    info: profileVM.profile.intro),
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
                                if let image = self.image {
                                    Image(uiImage: image)
                                         .resizable()
                                         .cornerRadius(50)
                                         .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.45)
                                         .background(Color(red: 0.9490, green: 0.9490, blue: 0.9490))
                                         .aspectRatio(contentMode: .fill)
                                         .clipShape(Circle())
                                } else {
                                    Image("")
                                         .resizable()
                                         .cornerRadius(50)
                                         .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.45)
                                         .background(Color(red: 0.9490, green: 0.9490, blue: 0.9490))
                                         .aspectRatio(contentMode: .fill)
                                         .clipShape(Circle())
                                }
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
                            value: $profileVM.profile.major,
                            placeholder:"Computer Systems Technology",
                            icon: "book.fill",
                            title: "Major",
                            errorMessage: $profileVM.majorError
                        )
                        // SCHOOL INPUT
                        InputFieldView(
                            value: $profileVM.profile.school,
                            placeholder:"Vancouver Community College",
                            icon: "house.fill",
                            title: "School Name",
                            errorMessage: $profileVM.schoolError
                        )
                        // START DATE INPUT
                        DatePickerView(
                            placholder: "Start Date",
                            month: $profileVM.profile.startDate.month,
                            year: $profileVM.profile.startDate.year)
                        // INFORMATION INPUT
                        MultiLineInputView(
                            value: $profileVM.profile.intro,
                            errorMessage: $profileVM.introError)
                        //: INFORMATION INPUT
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.6)
                    //: MAIN
                    Spacer()
                    Spacer()
                    // FOOTER
                    VStack() {
                        // Next button
                        ButtonView(action: {
                            // TODO: validation
                            profileVM.handleSubmit { _ in
                                Task {
                                    handleImage()
                                }
                                isProfileConfirmActive = true
                            }
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


