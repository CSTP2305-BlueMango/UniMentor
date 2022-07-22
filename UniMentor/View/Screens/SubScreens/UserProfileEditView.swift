//
//  UserProfileEditView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-06-22.
//

import SwiftUI

/// edit user profile information
struct UserProfileEditView: View {
    
    /// view model
    @StateObject var profileVM = ProfileViewModel();
    
    /// for selecting an image
    @State private var uiImage = UIImage()
    /// to view the photo library and user to choose a photo
    @State private var showSheet = false
    //get presentation mode object - presentation mode object is for poping child view from NavigationView stack
    @Environment(\.presentationMode) var presentation
    
    /// if pop up showing
    @State private var showPopUp: Bool = false
    
    @EnvironmentObject var userVM: UserViewModel
    
    @ObservedObject var imageVM = ImageViewModel()
    
    func onViewLoad() {
        if let user = userVM.user {
            self.profileVM.profile = ProfileInfo(
                name: user.name,
                major: user.major,
                school: user.school,
                intro: user.intro,
                imageUrl: user.image,
                startDate: StartDate.makeStartDateFromString(date: user.startDate))
        }
    }
    
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
                    // BODY
                    VStack(alignment: .center, spacing: UIScreen.main.bounds.height * 0.1) {
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
                                        // reference: https://stackoverflow.com/questions/25394536/uiimage-on-swift-cant-check-for-nil
                                        if self.uiImage.size.width != 0, let uiimage = self.uiImage {
                                            Image(uiImage: uiimage)
                                                 .resizable()
                                                 .cornerRadius(50)
                                                 .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.45)
                                                 .background(Color(red: 0.9490, green: 0.9490, blue: 0.9490))
                                                 .aspectRatio(contentMode: .fill)
                                                 .clipShape(Circle())
                                        } else {
                                            AsyncImage(url: URL(string: "\(profileVM.profile.imageUrl)")) { img in
                                                img
                                                    .resizable()
                                                    .cornerRadius(50)
                                                    .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.width * 0.45)
                                                    .background(Color(red: 0.9490, green: 0.9490, blue: 0.9490))
                                                    .aspectRatio(contentMode: .fill)
                                                    .clipShape(Circle())
                                            }placeholder: {ProgressView()}
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
                                        .background(Color("ButtonColor"))
                                        .cornerRadius(30)
                                        .padding(EdgeInsets(top: UIScreen.main.bounds.width * 0.3, leading: UIScreen.main.bounds.width * 0.33, bottom: 0, trailing: 0))
                                    }
                                }
                                    //need to modify placement of the "+" to make it fixed
                                
                                    //this is for when user clicks the button, shows the photo library
                                .sheet(isPresented: $showSheet) {
                                            // Pick an image from the photo library:
                                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$uiImage)
                                }
                            } // SELECT IMAGE
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
                                year: $profileVM.profile.startDate.year)
                            // information input
                            MultiLineInputView(
                                value: $profileVM.profile.intro,
                                errorMessage: $profileVM.introError)
                            
                        } //: MAIN
                        .frame(height: UIScreen.main.bounds.height * 0.78)
                        // FOOTER
                        VStack() {
                            // Save button
                            ButtonView(action: {
                                profileVM.handleSubmit { _ in
                                    // TODO: validation
                                    Task {
                                        handleImage()
                                    }
                                    showPopUp = true
                                }
                            },
                                 label: "Save Changes",
                                 color: Color("ButtonColor"),
                                 opacity: 1.0,
                                 isBorder: false
                            )
                        }
                        .padding(.bottom, UIScreen.main.bounds.height * 0.05)
                        //: FOOTER
                    } //: BODY
                    .padding(.top, UIScreen.main.bounds.height * 0.03)
                }
            } //: ScrollView
            // POPUP
            PopUpView(
                show: $showPopUp,
                information: "Update editted profile?",
                buttonAction: {
                    if self.uiImage.size.width == 0 {
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
                        showPopUp = false
                        presentation.wrappedValue.dismiss()
                    } else {
                        if imageVM.isImageFinished {
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
                            showPopUp = false
                            presentation.wrappedValue.dismiss()
                        }
                    }
                },
                buttonText: "Edit"
            )
            //: POPUP
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            onViewLoad()
        }
        //: ZSTACK
    }
}

struct UserProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileEditView()
    }
}
