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
                      .foregroundColor(.blue)
                }
                
                CardView(user: user)
                
            }//: HSTACK

        }
        .frame(width: UIScreen.main.bounds.width * 1).padding(.leading, UIScreen.main.bounds.width * 0.12)
        //: Button
    }
}

struct EditCardView_Previews: PreviewProvider {
    static var previews: some View {
        EditCardView(
            user: User(id: "", name: "sssss", image: "user_image", major: "test", school: "test", startDate: "Sep 2020", intro: "this is for testing", matchedUsers: [], sentRequests: [], recievedRequests: [])
        )
    }
}
