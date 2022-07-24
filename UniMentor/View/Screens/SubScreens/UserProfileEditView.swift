//
//  UserProfileEditView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-22.
//

import SwiftUI

/// edit user profile information
struct UserProfileEditView: View {
    /// for selecting an image
    @State private var uiImage = UIImage()
    /// to view the photo library and user to choose a photo
    @State private var showSheet = false
    /// edit pop up showing
    @State private var showEditPopUp: Bool = false
    
    /// user view model object
    @ObservedObject var userVM = UserViewModel()
    /// image view model object
    @ObservedObject var imageVM = ImageViewModel()
    /// profile view model
    @StateObject var profileVM = ProfileViewModel();
    
    /// view presentation mode
    @Environment(\.presentationMode) var presentation
    
    /// get current user profile and save to profile view model profile
    private func onViewLoad() {
        // if current user exists
        if let user = userVM.user {
            // save user profile to profile view model profile
            self.profileVM.profile = ProfileInfo(
                name: user.name,
                major: user.major,
                school: user.school,
                intro: user.intro,
                imageUrl: user.image,
                startDate: StartDate.makeStartDateFromString(date: user.startDate))
        }
    }
    
    /// save image to database
    private func handleImage() {
        imageVM.persistImageToStorage(image: self.uiImage)
    }
    
    var body: some View {
        ZStack {
            // ScrollView
            ScrollView {
                ZStack(alignment: .top) {
                    // Back Button
                    HStack {
                        Spacer()
                        Button(action: {
                            presentation.wrappedValue.dismiss()
                        }) {
                            Text("Cancel")
                                .foregroundColor(.black)
                                .font(Font.custom( "TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.04))
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    .padding(.top, UIScreen.main.bounds.height * 0.01)
                    // EDIT FORM
                    VStack(alignment: .center, spacing: UIScreen.main.bounds.height * 0.1) {
                        // HEADER
                        VStack {
                            // Title
                            HStack {
                                Text("Edit Profile")
                                    .font(Font.custom("Charm-Regular", size: UIScreen.main.bounds.width * 0.12))
                                Spacer()
                            }.frame(width: UIScreen.main.bounds.width * 0.9)
                        }.frame(height: UIScreen.main.bounds.height * 0.02)
                        //: HEADER
                        // MAIN
                        VStack(spacing: UIScreen.main.bounds.width * 0.015) {
                            // SELECT IMAGE
                            VStack {
                                // reference: https://designcode.io/swiftui-advanced-handbook-imagepicker
                                // select image
                                Button {
                                    // show image picker
                                    showSheet = true
                                } label: {
                                    ZStack {
                                        // reference: https://www.youtube.com/watch?v=MJuMIpdpORk
                                        // reference: https://stackoverflow.com/questions/25394536/uiimage-on-swift-cant-check-for-nil
                                        // User image
                                        if self.uiImage.size.width != 0, let uiimage = self.uiImage {
                                            // if image is changed
                                            Image(uiImage: uiimage)
                                                 .resizable()
                                                 .cornerRadius(50)
                                                 .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.45)
                                                 .background(Color(red: 0.9490, green: 0.9490, blue: 0.9490))
                                                 .aspectRatio(contentMode: .fill)
                                                 .clipShape(Circle())
                                        } else {
                                            // if image did not change
                                            AsyncImage(url: URL(string: "\(profileVM.profile.imageUrl)")) { img in
                                                img
                                                    .resizable()
                                                    .cornerRadius(50)
                                                    .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.45)
                                                    .background(Color(red: 0.9490, green: 0.9490, blue: 0.9490))
                                                    .aspectRatio(contentMode: .fill)
                                                    .clipShape(Circle())
                                            } placeholder: {ProgressView()}
                                        }
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
                                    } //: Button label
                                } //: Button
                                // shows the photo library
                                .sheet(isPresented: $showSheet) {
                                    // Pick an image from the photo library
                                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$uiImage)
                                }
                            } //: SELECT IMAGE
                            // INPUT FIELDS
                            // name input
                            InputFieldView(
                                value: $profileVM.profile.name,
                                placeholder:"John Doe",
                                icon: "person.fill",
                                title: "Name",
                                errorMessage: $profileVM.nameError
                            )
                            // major input
                            InputFieldView(
                                value: $profileVM.profile.major,
                                placeholder:"Computer Systems Technology",
                                icon: "book.fill",
                                title: "Major",
                                errorMessage: $profileVM.majorError
                            )
                            // school input
                            InputFieldView(
                                value: $profileVM.profile.school,
                                placeholder:"Vancouver Community College",
                                icon: "house.fill",
                                title: "School Name",
                                errorMessage: $profileVM.schoolError
                            )
                            // date input
                            DatePickerView(
                                placholder: "Start Date",
                                month: $profileVM.profile.startDate.month,
                                year: $profileVM.profile.startDate.year,
                                errorMessage: $profileVM.startDateError)
                            // information input
                            MultiLineInputView(
                                value: $profileVM.profile.intro,
                                errorMessage: $profileVM.introError)
                        }.frame(height: UIScreen.main.bounds.height * 0.78)
                        //: MAIN
                        // FOOTER
                        VStack() {
                            // Save button
                            ButtonView(action: {
                                // validate inputs
                                profileVM.handleSubmit { _ in
                                    // save image to database
                                    Task { handleImage() }
                                    // show edit popup
                                    showEditPopUp = true
                                }
                            },
                                 label: "Save Changes",
                                 color: Color("ButtonColor")
                            )
                        }.padding(.bottom, UIScreen.main.bounds.height * 0.05)
                        //: FOOTER
                    }.padding(.top, UIScreen.main.bounds.height * 0.03)
                    //: EDIT FORM
                } //: ZSTACK
            } //: ScrollView
            // POPUP
            // edit popup
            PopUpView(
                show: $showEditPopUp,
                information: "Update edited profile?",
                buttonAction: {
                    // if image not changed
                    if self.uiImage.size.width == 0 {
                        // update user profile to database
                        userVM.updateUser(updateUserData: User(
                            id: "",
                            name: profileVM.profile.name,
                            image: profileVM.profile.imageUrl,
                            major: profileVM.profile.major,
                            school: profileVM.profile.school,
                            startDate: "\(profileVM.profile.startDate.month) \(profileVM.profile.startDate.year)",
                            intro: profileVM.profile.intro,
                            matchedUsers: [],
                            sentRequests: [],
                            recievedRequests: []))
                        userVM.fetchCurrentUser()
                        // discard edit popup
                        showEditPopUp = false
                        // pop child view to go back to profile view
                        presentation.wrappedValue.dismiss()
                    }
                    // if image changed
                    else {
                        // if image link is ready
                        if imageVM.isImageFinished {
                            // update user profile to database
                            userVM.updateUser(updateUserData: User(
                                id: "",
                                name: profileVM.profile.name,
                                image: ImageViewModel.imageUrl,
                                major: profileVM.profile.major,
                                school: profileVM.profile.school,
                                startDate: "\(profileVM.profile.startDate.month) \(profileVM.profile.startDate.year)",
                                intro: profileVM.profile.intro,
                                matchedUsers: [],
                                sentRequests: [],
                                recievedRequests: []))
                            userVM.fetchCurrentUser()
                            // discard edit popup
                            showEditPopUp = false
                            // pop child view to go back to profile view
                            presentation.wrappedValue.dismiss()
                        }
                    }
                },
                buttonText: "Edit"
            )//: POPUP
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear { onViewLoad() }
        //: ZSTACK
    }
}

struct UserProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileEditView()
    }
}
