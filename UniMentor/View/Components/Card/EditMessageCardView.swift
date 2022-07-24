//
//  EditMessageCardView.swift
//  UniMentor
//
//  Created by Yoonseo Jeong on 2022-07-16.
//

import SwiftUI

/// message card view component for editing
/// param: MessageUser
struct EditMessageCardView: View {
    /// message user model
    @State var user: MessageUser
    /// card selected state
    @State var isOn1: Bool = false
    
    /// link user view model object
    @ObservedObject var LinkUsersVM = LinkUsersViewModel()
    
    var body: some View {
        // Clickable card
        Button(action: {
            // change card selected state
            isOn1 = !isOn1
            // if selected
            if isOn1 {
                // if user is not in selected users list
                if !LinkUsersViewModel.selectedMessageUsers.contains(where: { $0.id == user.id }) {
                    // append user to selected users list
                    LinkUsersViewModel.selectedMessageUsers.append(user)
                }
            }
            // if not selected
            else {
                // remove user from seleted users list
                LinkUsersViewModel.selectedMessageUsers.removeAll(where: { $0.id == user.id } )
            }
        }) {
            HStack(spacing: UIScreen.main.bounds.width * 0.04) {
                // Selected check icon
                HStack {
                    // reference: https://swiftuirecipes.com/blog/custom-toggle-checkbox-in-swiftui
                    Image(systemName: isOn1 ? "checkmark.circle.fill" : "circle")
                      .imageScale(.large)
                      .foregroundColor(.blue)
                }
                // Card view
                MessageCardView(user: user)
            }//: HSTACK
        }.frame(width: UIScreen.main.bounds.width * 1).padding(.leading, UIScreen.main.bounds.width * 0.12)
        //: Button

    }
}

struct EditMessageCardView_Previews: PreviewProvider {
    static var previews: some View {
        EditMessageCardView(
            user: MessageUser(data: ["id": "", "userName": "", "userImage": "", "fromId": "", "text": "", "timestamp": ""])
        )
    }
}
