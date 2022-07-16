//
//  EditCardView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-16.
//

import SwiftUI

struct EditCardView: View {
    
    /// card selected state
    @State var isOn1: Bool = false
    
    @State var user: User
    
    @ObservedObject var LinkUsersVM = LinkUsersViewModel()
    
    var body: some View {
        Button(action: {
            isOn1 = !isOn1
            if isOn1 {
                if !LinkUsersViewModel.selectedUsers.contains(where: { $0.id == user.id }) {
                    LinkUsersViewModel.selectedUsers.append(user)
                }
            } else {
                LinkUsersViewModel.selectedUsers.removeAll(where: { $0.id == user.id } )
            }
            print("\(LinkUsersViewModel.selectedUsers)")
        }) {
            HStack(spacing: UIScreen.main.bounds.width * 0.04) {
                // reference: https://swiftuirecipes.com/blog/custom-toggle-checkbox-in-swiftui
                HStack {
                    Image(systemName: isOn1 ? "checkmark.circle.fill" : "circle")
                      .imageScale(.large)
                    // configuration.label
                      .foregroundColor(.blue)
                }
                
                // CARD
                HStack(spacing: UIScreen.main.bounds.width * 0.03) {
                    // LEFT - Image
                    Spacer().frame(width: 0)
                    VStack {
                        Image(user.image)
                            .resizable()
                            .cornerRadius(50)
                            .aspectRatio(contentMode: .fill)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.18, height: UIScreen.main.bounds.width * 0.18)
                    .clipShape(Circle())
                    .shadow(radius: 3)
                    // CENTER - Information
                    VStack(alignment: .leading, spacing: UIScreen.main.bounds.width * 0.01) {
                        // user name
                        Text(user.name)
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.05))
                            .lineLimit(1)
                            .frame(width: UIScreen.main.bounds.width * 0.65, alignment: .leading)
                        // user major
                        Text(user.major)
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.035))
                            .lineLimit(1)
                        // user school
                        Text(user.school)
                            .font(Font.custom("TimesNewRomanPSMT", size: UIScreen.main.bounds.width * 0.03))
                            .lineLimit(1)
                    }.frame(width: UIScreen.main.bounds.width * 0.65)
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.1)
                .background(Color.white.cornerRadius(UIScreen.main.bounds.width * 0.04))
                .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                .buttonStyle(.bordered)
                .clipShape(RoundedRectangle(cornerRadius: 16)).shadow(color: Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3), radius: 5, x: 0, y: 0)
                //: CARD
            }//: HSTACK

        }
        .frame(width: UIScreen.main.bounds.width * 1).padding(.leading, UIScreen.main.bounds.width * 0.12)
        //: Button
    }
}

struct EditCardView_Previews: PreviewProvider {
    static var previews: some View {
        EditCardView(
            user: User(id: "", name: "sssss", image: "user_image", major: "test", school: "test", startDate: "Sep 2020", intro: "this is for testing", matchedUsers: [], sentRequests: [], recievedRequests: [], messageUsers: [])
        )
    }
}
